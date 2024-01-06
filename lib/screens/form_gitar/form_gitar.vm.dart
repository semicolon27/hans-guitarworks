import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:tugas_crud/common/components/alert.component.dart';
import 'package:tugas_crud/common/services/gitar.service.dart';
import 'package:tugas_crud/common/utils/print.util.dart';

class FormGitarVM extends BaseViewModel {
  GitarService gitarService = GitarService();

  TextEditingController merek = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController warna = TextEditingController();
  TextEditingController tahun = TextEditingController();
  TextEditingController dibuatDi = TextEditingController();
  TextEditingController material = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController gambar = TextEditingController();

  void getGitar(String id) async {
    try {
      Gitar gitar = await gitarService.getGitarsById(id);
      merek.text = gitar.merek;
      model.text = gitar.model;
      warna.text = gitar.warna;
      tahun.text = gitar.tahun;
      dibuatDi.text = gitar.dibuatDi;
      material.text = gitar.material;
      harga.text = gitar.harga.toString();
      gambar.text = gitar.gambar;
      notifyListeners();
    } catch (err) {
      printErrorCustom('getGitar', err);
    }
  }

  void addGitar() async {
    try {
      bool confirm = await openDialogConfirmation('Konfirmasi', 'Yakin akan menambah data ?', 'Tambah', 'Batal');
      if (!confirm) return;
      await gitarService.addGitar(
        merek: merek.text,
        model: model.text,
        warna: warna.text,
        tahun: tahun.text,
        dibuatDi: dibuatDi.text,
        material: material.text,
        harga: int.tryParse(harga.text) ?? 0,
        gambar: gambar.text,
      );
      openDialog('Berhasil Tambah Data', '');
    } catch (err) {
      openDialog('Gagal Tambah Data', '');
      printErrorCustom('addGitar', err);
    }
  }

  void editGitar(id) async {
    try {
      bool confirm = await openDialogConfirmation('Konfirmasi', 'Yakin akan mengedit data ?', 'Edit', 'Batal');
      if (!confirm) return;
      await gitarService.updateGitar(
        id: id,
        merek: merek.text,
        model: model.text,
        warna: warna.text,
        tahun: tahun.text,
        dibuatDi: dibuatDi.text,
        material: material.text,
        harga: int.tryParse(harga.text) ?? 0,
        gambar: gambar.text,
      );
      openDialog('Berhasil Edit Data', '');
    } catch (err) {
      openDialog('Gagal Edit Data', '');
      printErrorCustom('editGitar', err);
    }
  }
}
