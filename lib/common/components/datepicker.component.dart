import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

showDatePickerDialog({
  DateTime? initialDateTime,
  ValueChanged<DateTime>? onDateTimeChanged,
}) {
  showCupertinoModalPopup<void>(
    context: Get.context!,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: initialDateTime,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          // This is called when the user changes the date.
          onDateTimeChanged: onDateTimeChanged ?? (DateTime dateTime) {},
        ),
      ),
    ),
  );
}
