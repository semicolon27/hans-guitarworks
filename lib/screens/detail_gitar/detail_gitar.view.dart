import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/utils/formatting.util.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/screens/detail_gitar/detail_gitar.vm.dart';
import 'package:tugas_crud/screens/form_gitar/form_gitar.view.dart';

class DetailGitarView extends StatelessWidget {
  final String id;

  const DetailGitarView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailGitarVM>.reactive(
      viewModelBuilder: () => DetailGitarVM(),
      onViewModelReady: (model) => model.getGitar(id),
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Detail Gitar",
              style: UTextStyles.h5,
            ),
            backgroundColor: Colors.transparent, // Set AppBar background color to transparent
            elevation: 0, // Remove shadow
            iconTheme: const IconThemeData(
              color: Colors.black,
            ), // Set icon color to black
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Handle button press
              Get.to(
                () => FormGitarView(
                  isEdit: true,
                  id: id,
                ),
              );
            },
            child: const Icon(Icons.edit),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Builder(builder: (context) {
            if (vm.isBusy) {
              return Container(
                alignment: Alignment.center,
                height: Get.height,
                width: Get.width,
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Get.width,
                      alignment: Alignment.center,
                      child: Image.network(vm.gitar.gambar, height: 500.sp),
                    ),
                    Text(
                      vm.gitar.merek + ' ' + vm.gitar.model,
                      style: UTextStyles.h4,
                    ),
                    rowData('Merek', vm.gitar.merek),
                    rowData('Model', vm.gitar.model),
                    rowData('Warna', vm.gitar.warna),
                    rowData('Tahun', vm.gitar.tahun),
                    rowData('Dibuat di', vm.gitar.dibuatDi),
                    rowData('Material', vm.gitar.material),
                    rowData('Harga', rupiahFormat(vm.gitar.harga)),
                  ],
                ),
              );
            }
          }),
        );
      },
    );
  }
}

Widget rowData(String field, String value) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.all(10.sp),
    child: Row(
      children: [
        SizedBox(
          width: 100.sp,
          child: Text(
            field,
            style: UTextStyles.body1,
          ),
        ),
        Text(':', style: UTextStyles.body1),
        SizedBox(width: 5.sp),
        Expanded(
          child: Text(
            value,
            style: UTextStyles.body1,
          ),
        ),
      ],
    ),
  );
}
