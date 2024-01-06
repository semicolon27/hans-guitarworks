import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/providers/akun.provider.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AkunProvider>(Get.context!, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil",
            style: UTextStyles.h5,
          ),
          backgroundColor: Colors.transparent, // Set AppBar background color to transparent
          elevation: 0, // Remove shadow
          iconTheme: const IconThemeData(
            color: Colors.black,
          ), // Set icon color to black
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            rowData('User ID', prov.userid),
            rowData('Email', prov.email),
            rowData('No. HP', prov.nohp),
            rowData('Alamat', prov.alamat),
            rowData('Jenis Kelamin', prov.jk),
          ],
        ),
      ),
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
