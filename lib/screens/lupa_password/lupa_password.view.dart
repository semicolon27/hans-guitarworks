import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/components/button.component.dart';
import 'package:tugas_crud/common/components/image.component.dart';
import 'package:tugas_crud/common/components/input.component.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/screens/lupa_password/lupa_password.vm.dart';

class LupaPasswordView extends StatelessWidget {
  final bool isValidated;
  final String email;
  final String nohp;

  const LupaPasswordView({
    Key? key,
    this.isValidated = false,
    this.email = "",
    this.nohp = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VMLupaPassword>.reactive(
      viewModelBuilder: () => VMLupaPassword(),
      onViewModelReady: (model) {
        if (kDebugMode) {
          model.email.text = email;
          model.nohp.text = nohp;
        } else {
          model.email.text = email;
          model.nohp.text = nohp;
        }
      },
      builder: (context, model, child) {
        Widget logo() {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.sp),
                CImage(
                  'assets/images/app-logo.png',
                  height: 80.sp,
                ),
                SizedBox(height: 10.sp),
              ],
            ),
          );
        }

        Widget body() {
          // TODO: cek semua body apakah butuh singlechildscrollview atau tidak
          return SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SafeArea(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 25.sp, left: 20.sp),
                      height: 150.sp,
                      width: Get.width,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(25.sp),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.sp),
                          topRight: Radius.circular(15.sp),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: UTextStyles.fontSizeH6,
                                ),
                              ),
                              Text(
                                "Lupa Password",
                                style: UTextStyles.subtitle1.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.sp),
                          Text(
                            !isValidated ? "Silahkan masukan Email dan No HP untuk mengirimkan OTP" : "Masukan password baru.",
                            style: UTextStyles.caption,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.sp),
                          if (!isValidated)
                            Form(
                              key: model.formKey1,
                              child: Column(
                                children: [
                                  CTextFieldWithLabel(
                                    label: "Email",
                                    textController: model.email,
                                    keyboardType: TextInputType.emailAddress,
                                    validationType: ValidationType.emailType,
                                  ),
                                  CTextFieldWithLabel(
                                    label: "No. HP",
                                    textController: model.nohp,
                                    keyboardType: TextInputType.phone,
                                    validationType: ValidationType.normalType,
                                  ),
                                ],
                              ),
                            ),
                          if (isValidated)
                            Form(
                              key: model.formKey2,
                              child: Column(
                                children: [
                                  CTextFieldWithLabel(
                                    label: "Password Baru",
                                    textController: model.newPassword,
                                    fieldKey: model.passwordFieldKey,
                                    validationType: ValidationType.passwordType,
                                    obscureText: model.obscurePassword1,
                                    suffix: GestureDetector(
                                      onTap: () => model.toggleObsecurePassword(1),
                                      child: Icon(
                                        model.obscurePassword1 ? Icons.lock_outline : Icons.lock_open,
                                      ),
                                    ),
                                  ),
                                  CTextFieldWithLabel(
                                    label: "Konfirmasi Password Baru",
                                    textController: model.confirmPassword,
                                    validationKey: model.passwordFieldKey,
                                    validationType: ValidationType.confrimPasswordType,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    obscureText: model.obscurePassword2,
                                    suffix: GestureDetector(
                                      onTap: () => model.toggleObsecurePassword(2),
                                      child: Icon(
                                        model.obscurePassword2 ? Icons.lock_outline : Icons.lock_open,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(height: 20.sp),
                          CButton(
                            text: "Selanjutnya",
                            onPressed: () async {
                              if (!isValidated && (model.formKey1.currentState?.validate() ?? false)) {
                                model.submitValidasiLupaPassword();
                              } else if (isValidated && (model.formKey2.currentState?.validate() ?? false)) {
                                model.submitResetPassword();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              //TODO: CMainBackground(),
              logo(),
              body(),
            ],
          ),
        );
      },
    );
  }
}
