import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class UValidation {
  static const int phoneLimit = 16;
  static const int textNormalLimit = 50;
  static const int textDescLimit = 20;

  static List<TextInputFormatter> formatPhone([int maxLength = phoneLimit]) {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(maxLength),
    ];
  }

  static List<TextInputFormatter> formatTextNormal(
      [int maxLength = textNormalLimit]) {
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(maxLength),
    ];
  }

  static List<TextInputFormatter> formatTextDesc(
      [int maxLength = textDescLimit]) {
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(maxLength),
    ];
  }

  static List<TextInputFormatter> formatCurrency() {
    return [
      CurrencyInputFormatter(),
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(11),
    ];
  }

  static List<TextInputFormatter> formatCharOnly() {
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(textNormalLimit),
      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]")),
    ];
  }

  static TextInputType typeNumber() {
    return TextInputType.number;
  }

  static TextInputType typeString() {
    return TextInputType.text;
  }

  static TextInputType typeEmail() {
    return TextInputType.emailAddress;
  }

  static TextInputType typePhone() {
    return TextInputType.phone;
  }

  static String? normalCheck(String field, String value,
      [int minLength = 8, int maxLength = 200]) {
    var msg = '';

    if (value == null || value.isEmpty) {
      return "$field Tidak Boleh Kosong";
    }

    bool hasMinLength = value.length >= minLength;
    if (!hasMinLength) msg = msg + "$field Minimal $minLength Karakter\n";

    bool hasMaxLength = value.length <= maxLength;
    if (!hasMaxLength) msg = msg + "$field Maksimal $maxLength Karakter\n";

    if (msg.length == 0) {
      return null;
    } else {
      msg = msg.substring(0, msg.length - 1);
      return msg;
    }
  }

  static String? emailCheck(String value) {
    final RegExp emailRegex = new RegExp(
        r"^[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

    if (value.isEmpty) {
      return 'Email Tidak Boleh Kosong';
    }

    if (!emailRegex.hasMatch(value)) {
      return "Format Email Tidak Sesuai";
    }

    return null;
  }

  static String? passwordComplex(String password,
      [int minLength = 8, int maxLength = 15, bool specialChar = true]) {
    var msg = '';

    if (password == null || password.isEmpty) {
      return "Password Tidak Boleh Kosong";
    }

    bool hasMinLength = password.length >= minLength;
    if (!hasMinLength) msg = msg + "Password Minimal $minLength\n";

    bool hasMaxLength = password.length <= maxLength;
    if (!hasMaxLength) msg = msg + "Password Maksimal $maxLength\n";

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    if (!hasUppercase) msg = msg + "Password Harus Terdapat Huruf Besar\n";

    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    if (!hasLowercase) msg = msg + "Password Harus Terdapat Huruf Kecil\n";

    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    if (!hasDigits) msg = msg + "Password Harus Terdapat Angka\n";

    if (specialChar) {
      bool hasSpecialCharacters =
          password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      if (!hasSpecialCharacters)
        msg = msg + "Password Harus Terdapat Spesial Karakter\n";
    }

    if (msg.length == 0) {
      return null;
    } else {
      msg = msg.substring(0, msg.length - 1);
      return msg;
    }
  }

  static String? confirmPasswordCheck(String retype, String password) {
    var msg = '';

    if (password == null || password.isEmpty) {
      return "Password Tidak Boleh Kosong";
    }

    if (retype != password) {
      msg = msg + "Password Tidak Sama\n";
    }

    if (msg.length == 0) {
      return null;
    } else {
      msg = msg.substring(0, msg.length - 1);
      return msg;
    }
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  // main(){}
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = new NumberFormat("#,###");
      int num = int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(num);
      return new TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
