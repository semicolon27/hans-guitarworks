import 'dart:convert';

import 'package:core_mobile/core_enkripsi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_crud/common/components/alert.component.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/services/auth.service.dart';
import 'package:tugas_crud/common/utils/encryption.util.dart';
import 'package:tugas_crud/common/utils/print.util.dart';
import 'package:tugas_crud/screens/beranda/beranda.view.dart';
import 'package:tugas_crud/screens/login/login.view.dart';

class RegisterVM extends BaseViewModel {
  // EncryptionUtil enc = EncryptionUtil();

  AkunService akunService = AkunService();
  bool obscurePassword = true;

  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  String jk = '';

  int step = 1;

  void toStep1() {
    step = 1;
    notifyListeners();
  }

  void toStep2() {
    step = 2;
    notifyListeners();
  }

  void register() async {
    Akun? akun = await akunService.getAkun(userid.text);
    if (akun != null) {
      openDialog('Registrasi Gagal', 'Username sudah digunakan');
    }

    // TODO:
    if (password != repassword) print('Password Berbeda');
    try {
      setBusy(true);
      var key = 'Omaskdamoanpjnaa';

      await akunService.addAkun(
        userid: userid.text,
        password: CoreEnkripsi().encrypt(key, password.text),
        email: email.text,
        nohp: nohp.text,
        alamat: alamat.text,
        jk: jk,
      );
      setBusy(false);
      await openDialog('Registrasi Berhasil', '');
      Get.off(() => LoginView());
    } catch (err) {
      printErrorCustom('login', err);
    } finally {
      setBusy(false);
    }
  }

  void toggleObsecurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
