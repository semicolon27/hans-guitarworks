import 'dart:convert';

import 'package:core_mobile/core_enkripsi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tugas_crud/common/components/alert.component.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/services/auth.service.dart';
import 'package:tugas_crud/common/utils/encryption.util.dart';
import 'package:tugas_crud/common/utils/print.util.dart';
import 'package:tugas_crud/providers/akun.provider.dart';
import 'package:tugas_crud/screens/beranda/beranda.view.dart';

class LoginVM extends BaseViewModel {
  AkunService akunService = AkunService();
  bool obscurePassword = true;

  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    setBusy(true);
    try {
      Akun? akun = await akunService.getAkun(userid.text);
      if (akun == null) {
        openDialog('Login Gagal', 'Username atau Password Salah');
      } else {
        var key = 'Omaskdamoanpjnaa';
        String dbpassword = CoreEnkripsi().decrypt(key, akun.password);

        if (dbpassword == password.text) {
          final prov = Provider.of<AkunProvider>(Get.context!, listen: false);

          prov.id = akun.id;
          prov.userid = akun.userid;
          prov.email = akun.email;
          prov.nohp = akun.nohp;
          prov.alamat = akun.alamat;
          prov.jk = akun.jk;

          Get.to(() => BerandaView());
        } else {
          print('password salah');
          openDialog('Login Gagal', 'Username atau Password Salah');
        }
      }
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
