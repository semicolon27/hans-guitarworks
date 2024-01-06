import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/components/button.component.dart';
import 'package:tugas_crud/common/components/image.component.dart';
import 'package:tugas_crud/common/components/input.component.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/common/utils/validation.util.dart';
import 'package:tugas_crud/screens/beranda/beranda.view.dart';
import 'package:tugas_crud/screens/login/login.vm.dart';
import 'package:tugas_crud/screens/lupa_password/lupa_password.view.dart';
import 'package:tugas_crud/screens/register/register.view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<LoginVM>.reactive(
      viewModelBuilder: () => LoginVM(),
      onViewModelReady: (model) {
        if (kDebugMode) {
          model.userid.text = 'hanjo';
          model.password.text = 'aaaaaaaa';
        }
      },
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: CImage(
                        'assets/images/logo.png',
                        height: 150.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Container(
                    padding: EdgeInsets.all(25.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.sp),
                        topRight: Radius.circular(15.sp),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login',
                            style: UTextStyles.h4.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        CTextFieldWithLabel(
                          label: "User ID",
                          textController: model.userid,
                          inputFormatters: UValidation.formatTextNormal(),
                          textAlign: TextAlign.left,
                          keyboardType: UValidation.typeString(),
                          isValidation: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validationType: ValidationType.normalType,
                        ),
                        CInputLabel(
                          label: "Password",
                          child: CTextField(
                            controller: model.password,
                            obscureText: model.obscurePassword,
                            suffix: GestureDetector(
                              onTap: () => model.toggleObsecurePassword(),
                              child: Icon(
                                model.obscurePassword ? Icons.lock_outline : Icons.lock_open,
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

                        SizedBox(height: 15.sp),
                        CButton(
                          text: 'LOGIN',
                          onPressed: () {
                            model.login();
                            // Get.to(() => BerandaView());
                          },
                          loading: model.isBusy,
                        ),
                        // CButton(
                        //   text: "Register lagnsung",
                        //   onPressed: () {
                        //     Get.toNamed('/register');
                        //   },
                        // ),
                        SizedBox(height: 20.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum Punya Akun ? ",
                              style: UTextStyles.caption.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            InkWell(
                              child: Text(
                                "Registrasi",
                                style: UTextStyles.caption.copyWith(
                                  color: UColors.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                Get.to(() => RegisterView());
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.mediaQueryViewInsets.bottom == 0 ? 100.sp : 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
