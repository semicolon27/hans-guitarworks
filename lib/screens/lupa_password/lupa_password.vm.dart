import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VMLupaPassword extends BaseViewModel {
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormFieldState<String>> passwordFieldKey = GlobalKey<FormFieldState<String>>();

  TextEditingController email = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController kdmitra = TextEditingController();
  TextEditingController nmmitra = TextEditingController(); // buat tampilan aja, kdmitra yg dikirim ke API
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool obscurePassword1 = true;
  bool obscurePassword2 = true;

  void toggleObsecurePassword(int urut) {
    if (urut == 1) obscurePassword1 = !obscurePassword1;
    if (urut == 2) obscurePassword2 = !obscurePassword2;
    notifyListeners();
  }

  void submitValidasiLupaPassword() async {
    // bool confirm = await showDialog(
    //       context: Get.context!,
    //       builder: (BuildContext context) => CAlertOption(
    //         content: 'Anda akan dikirimkan OTP, pastikan no hp dan email anda sudah sesual dengan akun anda.',
    //         // content: 'Anda akan dikirimkan OTP dan akun akan DINONAKTIFKAN sampai berhasil verifikasi OTP.',
    //         title: 'Reset Password ?',
    //         // cancelText: 'Tidak',
    //         // confirmText: 'Ya, Reset Password',
    //         cancelText: 'Batal',
    //         confirmText: 'Lanjutkan Reset Password',
    //         confirmColor: UColors.danger,
    //         onCancel: () {
    //           Get.back(result: false);
    //         },
    //         onConfirm: () {
    //           Get.back(result: true);
    //         },
    //       ),
    //       barrierDismissible: false,
    //     ) ??
    //     false;
    // if (confirm) {
    //   validasiLupaPassword();
    // }
  }

  void validasiLupaPassword() async {
    // // setBusyForObject(listMitra, true);
    // try {
    //   Map jsonResp = await ctrMitra.getAllMitra();

    //   if (jsonResp['rc'] != '000') {
    //     showDialog(
    //       context: Get.context!,
    //       builder: (BuildContext context) => CAlert(
    //         content: jsonResp['msg'],
    //       ),
    //       barrierDismissible: false,
    //     );
    //   } else {
    //     final prov = Provider.of<PAuth>(Get.context!, listen: false);
    //     Get.to(
    //       () => VOTP(
    //         nohp: nohp.text,
    //         email: email.text,
    //         kdmitra: prov.kdmitra,
    //         noreg: jsonResp['data']?['noreg'] ?? "",
    //         isResetPassword: true,
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   print(e);
    // } finally {
    //   // setBusyForObject(listMitra, false);
    // }
  }

  void submitResetPassword() async {
    // // setBusyForObject(listMitra, true);
    // try {
    //   Map jsonResp = await ctr.forgotPassword(
    //     email: email.text,
    //     nohp: nohp.text,
    //     newPassword: newPassword.text,
    //   );

    //   if (jsonResp['rc'] != '000') {
    //     showDialog(
    //       context: Get.context!,
    //       builder: (BuildContext context) => CAlert(
    //         content: jsonResp['msg'],
    //       ),
    //       barrierDismissible: false,
    //     );
    //   } else {
    //     kReleaseMode
    //         ? Get.offAll(() => VSuccessAction(
    //               action: SuccessAction.resetPassword,
    //             ))
    //         : Get.to(() => VSuccessAction(
    //               action: SuccessAction.resetPassword,
    //             ));
    //   }
    // } catch (e) {
    //   print(e);
    // } finally {
    //   // setBusyForObject(listMitra, false);
    // }
  }
}
