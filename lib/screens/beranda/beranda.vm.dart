import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/services/gitar.service.dart';
import 'package:tugas_crud/common/utils/print.util.dart';

class BerandaVM extends BaseViewModel {
  GitarService gitarService = GitarService();

  List<Gitar> listGitar = [];

  void getGitar() async {
    try {
      setBusy(true);
      listGitar = await gitarService.getGitars();
      notifyListeners();
    } catch (err) {
      printErrorCustom('getGitar', err);
    } finally {
      setBusy(false);
    }
  }

  void deleteGitar(id) async {
    try {
      await gitarService.deleteGitar(id);
      getGitar();
      notifyListeners();
    } catch (err) {
      printErrorCustom('getGitar', err);
    }
  }
}
