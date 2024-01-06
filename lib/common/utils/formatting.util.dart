import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

enum FormatTanggal {
  yyyymmdd,
  ddmmyyyy,
}

class UFormatting {
  static List get listBulan => [
        "Januari",
        "Februari",
        "Maret",
        "April",
        "Mei",
        "Juni",
        "Juli",
        "Agustus",
        "September",
        "Oktober",
        "November",
        "Desember",
      ];

  static String getStringTime() {
    final dateFormat = DateFormat('yyyyMMddhhmmss');
    return dateFormat.format(DateTime.now());
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.'; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) && oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and value are different
    if (oldValueText != newValueText) {
      int selectionIndex = newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the value and old value are the same, just return as-is
    return newValue;
  }
}

String formatTanggal(String tanggal, {FormatTanggal format = FormatTanggal.ddmmyyyy, separator = '-'}) {
  if (tanggal.length > 8) {
    return "";
  }
  String tangnew;
  //20191230
  //01234567
  if (format == FormatTanggal.ddmmyyyy) {
    tangnew = tanggal.substring(6, 8);
    tangnew = "$tangnew$separator${tanggal.substring(4, 6)}";
    tangnew = "$tangnew$separator${tanggal.substring(0, 4)}";
  } else {
    tangnew = tanggal.substring(0, 4);
    tangnew = "$tangnew$separator${tanggal.substring(4, 6)}";
    tangnew = "$tangnew$separator${tanggal.substring(6, 8)}";
  }

  return tangnew;
}

DateTime? parseDate(String input, [FormatTanggal format = FormatTanggal.ddmmyyyy]) {
  try {
    if (format == FormatTanggal.ddmmyyyy) {
      return DateFormat("dd-MM-yyyy").parse(input);
    } else {
      return DateFormat("yyyy-MM-dd").parse(input);
    }
  } catch (e) {
    print(e);
    // return DateTime.now();
  }
}

String formatTimeString(String time, {String separator = ':'}) {
  if (time.length != 6) {
    return "";
  }
  String timenew;
  //20191230
  //01234567
  timenew = time.substring(0, 2);
  timenew = "$timenew$separator${time.substring(2, 4)}";
  timenew = "$timenew$separator${time.substring(4, 6)}";
  return timenew;
  // if (format == FormatTanggal.ddmmyyyy) {
  //   tangnew = tanggal.substring(6, 8);
  //   tangnew = "$tangnew$separator${tanggal.substring(4, 6)}";
  //   tangnew = "$tangnew$separator${tanggal.substring(0, 4)}";
}

String rupiahFormat(dynamic nominal, [int decimalDigits = 0]) {
  String number = NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: decimalDigits).format(nominal);
  return 'Rp' + number.replaceAll(',00', '');
}

String numberFormat(dynamic nominal, [int decimalDigits = 0]) {
  String number = NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: decimalDigits).format(nominal);
  return number.replaceAll(',00', '');
}

String getDayFromStringDate(String tanggal) {
  return DateFormat("EEEE", 'id').format(parseDate(formatTanggal(tanggal, separator: '-', format: FormatTanggal.yyyymmdd), FormatTanggal.yyyymmdd)!);
}

String getMonthNameFromStringDate(String tanggal) {
  return DateFormat("MMMM", 'id').format(parseDate(formatTanggal(tanggal, separator: '-', format: FormatTanggal.yyyymmdd), FormatTanggal.yyyymmdd)!);
}

String getDateFromMonthDate(String tanggal) {
  return DateFormat("dd", 'id').format(parseDate(formatTanggal(tanggal, separator: '-', format: FormatTanggal.yyyymmdd), FormatTanggal.yyyymmdd)!);
}
