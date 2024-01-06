import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tugas_crud/common/components/image.component.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';

class CCheckbox extends StatelessWidget {
  final String label;
  final bool value;

  const CCheckbox({
    Key? key,
    this.label = '',
    this.value = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      // margin: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        children: [
          CImage(
            value ? 'assets/icons/checkbox-on.png' : 'assets/icons/checkbox-off.svg',
            height: 20.sp,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.sp),
          Text(
            label,
            style: UTextStyles.body1,
          ),
        ],
      ),
    );
  }
}
