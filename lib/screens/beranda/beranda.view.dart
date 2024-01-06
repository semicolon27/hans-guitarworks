import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/components/button.component.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/screens/beranda/beranda.vm.dart';
import 'package:tugas_crud/screens/detail_gitar/detail_gitar.view.dart';
import 'package:tugas_crud/screens/form_gitar/form_gitar.view.dart';
import 'package:tugas_crud/screens/login/login.view.dart';
import 'package:tugas_crud/screens/profil/profil.view.dart';

class BerandaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BerandaVM>.reactive(
      viewModelBuilder: () => BerandaVM(),
      onViewModelReady: (model) => model.getGitar(),
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent, // Set AppBar background color to transparent
            elevation: 0, // Remove shadow
            iconTheme: IconThemeData(
              color: Colors.black,
            ), // Set icon color to black
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'Menu',
                    style: UTextStyles.h4,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Profil',
                    style: UTextStyles.h5,
                  ),
                  onTap: () {
                    Get.to(() => const ProfilView());
                  },
                ),
                ListTile(
                  title: Text(
                    'Keluar',
                    style: UTextStyles.h5,
                  ),
                  onTap: () {
                    Get.off(() => LoginView());
                  },
                ),
              ],
            ),
          ),
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Text(
                    'Daftar Gitar',
                    style: UTextStyles.h3,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.sp,
                        child: CButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            // model.login();
                            Get.to(
                              () => FormGitarView(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50.sp,
                        child: CButton(
                          child: Icon(
                            Icons.refresh,
                            color: UColors.primary,
                          ),
                          primary: Colors.transparent,
                          onPressed: () {
                            vm.getGitar();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Builder(builder: (context) {
                    if (vm.isBusy) {
                      return Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80.sp,
                                    child: Text(
                                      'No.',
                                      style: UTextStyles.h5.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Nama',
                                      style: UTextStyles.h5.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              for (int i = 0; i < vm.listGitar.length; i++)
                                InkWell(
                                  onTap: () => Get.to(
                                    () => DetailGitarView(id: vm.listGitar[i].id.toString()),
                                  ),
                                  child: Column(
                                    children: [
                                      Dismissible(
                                        direction: DismissDirection.endToStart,
                                        key: Key(vm.listGitar[i].id.toString()),
                                        onDismissed: (direction) {
                                          // Remove the item from the data source
                                          vm.deleteGitar(vm.listGitar[i].id.toString());
                                          // Show a snackbar with the item name
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('${vm.listGitar[i].model} removed'),
                                            ),
                                          );
                                        },
                                        background: Container(
                                          color: Colors.red,
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(right: 16.0),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 15),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 80.sp,
                                                child: Text((i + 1).toString(), style: UTextStyles.subtitle1),
                                              ),
                                              Expanded(
                                                child: Text(vm.listGitar[i].merek + ' ' + vm.listGitar[i].model, style: UTextStyles.subtitle1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
