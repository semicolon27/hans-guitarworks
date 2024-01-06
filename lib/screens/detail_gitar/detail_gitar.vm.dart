import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/services/gitar.service.dart';
import 'package:tugas_crud/common/utils/print.util.dart';

class DetailGitarVM extends BaseViewModel {
  GitarService gitarService = GitarService();

  Gitar gitar = Gitar();

  void getGitar(String id) async {
    try {
      setBusy(true);
      gitar = await gitarService.getGitarsById(id);
      notifyListeners();
    } catch (err) {
      printErrorCustom('getGitar', err);
    } finally {
      setBusy(false);
    }
  }
}
