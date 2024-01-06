// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/components/alert.component.dart';
import 'package:tugas_crud/common/components/button.component.dart';
import 'package:tugas_crud/common/components/input.component.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/common/utils/validation.util.dart';
import 'package:tugas_crud/screens/register/register.vm.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<RegisterVM>.reactive(
        viewModelBuilder: () => RegisterVM(),
        builder: (context, vm, child) {
          return WillPopScope(
            onWillPop: () async {
              if (vm.step == 2) {
                vm.step = 1;
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
              body: SafeArea(
                child: Builder(
                  builder: (context) {
                    if (vm.step == 1) {
                      return SingleChildScrollView(
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          padding: EdgeInsets.all(20.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Registrasi',
                                  style: UTextStyles.h3.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.sp),
                              CTextFieldWithLabel(
                                label: "User ID",
                                textController: vm.userid,
                                inputFormatters: UValidation.formatTextNormal(),
                                textAlign: TextAlign.left,
                                isValidation: true,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                              ),
                              CInputLabel(
                                label: "Password",
                                child: CTextField(
                                  controller: vm.password,
                                  obscureText: vm.obscurePassword,
                                  suffix: GestureDetector(
                                    onTap: () => vm.toggleObsecurePassword(),
                                    child: Icon(
                                      vm.obscurePassword ? Icons.lock_outline : Icons.lock_open,
                                    ),
                                  ),
                                  inputFormatters: UValidation.formatTextNormal(),
                                  textAlign: TextAlign.left,
                                  keyboardType: UValidation.typeString(),
                                  isValidation: true,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validationType: ValidationType.normalType,
                                ),
                              ),
                              CInputLabel(
                                label: "Konfirmasi Password",
                                child: CTextField(
                                  controller: vm.repassword,
                                  obscureText: vm.obscurePassword,
                                  suffix: GestureDetector(
                                    onTap: () => vm.toggleObsecurePassword(),
                                    child: Icon(
                                      vm.obscurePassword ? Icons.lock_outline : Icons.lock_open,
                                    ),
                                  ),
                                  inputFormatters: UValidation.formatTextNormal(),
                                  textAlign: TextAlign.left,
                                  keyboardType: UValidation.typeString(),
                                  isValidation: true,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validationType: ValidationType.normalType,
                                ),
                              ),
                              CButton(
                                text: 'SELANJUTNYA',
                                onPressed: () {
                                  // model.login();
                                  print('WWWWWWWWWWW');
                                  print(vm.password.text);
                                  print(vm.repassword.text);
                                  if (vm.password.text != vm.repassword.text) {
                                    openDialog('Error', 'Password Konfirmasi Tidak Sama');
                                  } else {
                                    vm.toStep2();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          padding: EdgeInsets.all(10.sp),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => vm.toStep1(),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 40.sp,
                                    ),
                                    Text('Kembali', style: UTextStyles.h5),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Registrasi',
                                  style: UTextStyles.h3.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              CTextFieldWithLabel(
                                label: "Nama",
                                textController: vm.nama,
                                inputFormatters: UValidation.formatTextNormal(),
                                textAlign: TextAlign.left,
                                isValidation: true,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                              ),
                              CTextFieldWithLabel(
                                label: "Email",
                                textController: vm.email,
                                inputFormatters: UValidation.formatTextNormal(),
                                textAlign: TextAlign.left,
                                isValidation: true,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                              ),
                              CTextFieldWithLabel(
                                label: "No. HP",
                                textController: vm.nohp,
                                inputFormatters: UValidation.formatPhone(15),
                                textAlign: TextAlign.left,
                                keyboardType: UValidation.typePhone(),
                                isValidation: true,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                              ),
                              CInputLabel(
                                label: "Jenis Kelamin",
                                child: SizedBox(
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CRadioButton(
                                          title: "Laki-laki",
                                          value: 'L',
                                          groupValue: vm.jk,
                                          onChanged: (val) {
                                            vm.jk = val ?? '';
                                            vm.notifyListeners();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: CRadioButton(
                                          title: "Perempuan",
                                          value: 'P',
                                          groupValue: vm.jk,
                                          onChanged: (val) {
                                            vm.jk = val ?? '';
                                            vm.notifyListeners();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              CTextFieldWithLabel(
                                label: "Alamat",
                                textController: vm.alamat,
                                inputFormatters: UValidation.formatTextNormal(),
                                textAlign: TextAlign.left,
                                isValidation: true,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                              ),
                              CButton(
                                text: 'REGISTRASI',
                                onPressed: () {
                                  vm.register();
                                },
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        });
  }
}
