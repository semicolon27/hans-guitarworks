import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_crud/common/utils/formatting.util.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';
import 'package:tugas_crud/common/utils/validation.util.dart';

const EdgeInsets inputPadding = EdgeInsets.symmetric(
  vertical: 10,
  horizontal: 10,
);

enum ValidationType {
  none,
  normalType,
  emailType,
  passwordType,
  confrimPasswordType,
}

class CInputLabel extends StatelessWidget {
  final String? label;
  final Widget? child;
  final double? labelSpace;

  const CInputLabel({
    @required this.label,
    @required this.child,
    this.labelSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: UTextStyles.caption.copyWith(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        SizedBox(height: labelSpace ?? 5.sp),
        child!,
      ],
    );
  }
}

class CTextFieldWithLabel extends StatelessWidget {
  final bool readOnly;
  final String? label;
  final String? textHint;
  final TextEditingController? textController;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final bool isValidation;
  final int validationLength;
  final AutovalidateMode autovalidateMode;
  final ValidationType validationType;
  final Widget? suffix;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final GlobalKey<FormFieldState<String>>? fieldKey;
  final GlobalKey<FormFieldState<String>>? validationKey;

  const CTextFieldWithLabel({
    this.readOnly = false,
    this.label,
    this.textHint,
    this.textController,
    this.inputFormatters,
    this.textAlign = TextAlign.left,
    this.keyboardType,
    this.isValidation = true,
    this.validationLength = 5,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validationType = ValidationType.normalType,
    this.suffix,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.fieldKey,
    this.validationKey,
  });
  @override
  Widget build(BuildContext context) {
    return CInputLabel(
      label: label,
      child: CTextField(
        fieldKey: fieldKey,
        validationKey: validationKey,
        obscureText: obscureText,
        readOnly: readOnly,
        textHint: textHint,
        suffix: suffix,
        controller: textController,
        inputFormatters: inputFormatters ?? UValidation.formatTextNormal(),
        textAlign: textAlign,
        keyboardType: keyboardType ?? UValidation.typeString(),
        isValidation: isValidation,
        validationLength: validationLength,
        autovalidateMode: autovalidateMode,
        validationType: validationType,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

class CTextField extends StatelessWidget {
  final String? textLabel;
  final String? textHint;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextEditingController? controller;
  final GlobalKey<FormFieldState<String>>? fieldKey;
  final GlobalKey<FormFieldState<String>>? validationKey;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isPassword;
  final bool isValidation;
  final ValidationType validationType;
  final AutovalidateMode autovalidateMode;
  final FormFieldState<String>? formFieldState;
  final int validationLength;
  final bool readOnly;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool dense;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool? autofocus;

  const CTextField({
    this.textLabel,
    this.textHint,
    this.textAlign = TextAlign.left,
    this.style,
    this.controller,
    this.fieldKey,
    this.validationKey,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
    this.isPassword = false,
    this.isValidation = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validationType = ValidationType.none,
    this.formFieldState,
    this.validationLength = 8,
    this.readOnly = false,
    this.onChanged,
    this.suffixIcon,
    this.dense = true,
    this.suffix,
    this.validator,
    this.onFieldSubmitted,
    this.prefix,
    this.focusNode,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // cursorHeight: 20,
      key: fieldKey,
      obscureText: obscureText,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      textAlign: textAlign,
      style: style ?? UTextStyles.body1,
      autovalidateMode: autovalidateMode,
      autofocus: autofocus ?? false,
      onChanged: onChanged,
      readOnly: readOnly,
      validator: validator ??
          (String? value) {
            if (isValidation) {
              switch (validationType) {
                case ValidationType.none:
                  return null;
                case ValidationType.normalType:
                  return UValidation.normalCheck(
                    textHint ?? textLabel ?? "",
                    value ?? "",
                    validationLength,
                  );
                case ValidationType.emailType:
                  return UValidation.emailCheck(value ?? "");
                case ValidationType.passwordType:
                  return UValidation.passwordComplex(value ?? "");
                case ValidationType.confrimPasswordType:
                  return UValidation.confirmPasswordCheck(
                    value ?? "",
                    validationKey?.currentState?.value ?? "",
                  );
              }
            }
            return null;
          },
      decoration: InputDecoration(
        filled: true,
        contentPadding: inputPadding,
        hintText: textHint,
        hintStyle: style ??
            UTextStyles.caption.copyWith(
              color: UColors.textHint,
              fontWeight: FontWeight.normal,
            ),
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: UColors.border,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: UColors.secondary,
            width: 2,
          ),
        ),
        helperText: dense ? '' : null,
        helperStyle: GoogleFonts.nunito(height: 0.8),
        errorStyle: GoogleFonts.nunito(height: 0.8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: UColors.border,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}

class CTextFieldFilled extends StatelessWidget {
  final String? textLabel;
  final String? textHint;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextEditingController? controller;
  final GlobalKey<FormFieldState<String>>? fieldKey;
  final GlobalKey<FormFieldState<String>>? validationKey;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isPassword;
  final bool isValidation;
  final ValidationType validationType;
  final AutovalidateMode autovalidateMode;
  final FormFieldState<String>? formFieldState;
  final int validationLength;
  final bool readOnly;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool dense;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool? autofocus;

  const CTextFieldFilled({
    this.textLabel,
    this.textHint,
    this.textAlign = TextAlign.left,
    this.style,
    this.controller,
    this.fieldKey,
    this.validationKey,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
    this.isPassword = false,
    this.isValidation = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validationType = ValidationType.none,
    this.formFieldState,
    this.validationLength = 8,
    this.readOnly = false,
    this.onChanged,
    this.suffixIcon,
    this.dense = true,
    this.suffix,
    this.validator,
    this.onFieldSubmitted,
    this.prefix,
    this.focusNode,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // cursorHeight: 20,
      key: fieldKey,
      obscureText: obscureText,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      textAlign: textAlign,
      style: style ?? UTextStyles.body1,
      autovalidateMode: autovalidateMode,
      autofocus: autofocus ?? false,
      onChanged: onChanged,
      readOnly: readOnly,
      validator: validator ??
          (String? value) {
            if (isValidation) {
              switch (validationType) {
                case ValidationType.none:
                  return null;
                case ValidationType.normalType:
                  return UValidation.normalCheck(
                    textHint ?? textLabel ?? "",
                    value ?? "",
                    validationLength,
                  );
                case ValidationType.emailType:
                  return UValidation.emailCheck(value ?? "");
                case ValidationType.passwordType:
                  return UValidation.passwordComplex(value ?? "");
                case ValidationType.confrimPasswordType:
                  return UValidation.confirmPasswordCheck(
                    value ?? "",
                    validationKey?.currentState?.value ?? "",
                  );
              }
            }
            return null;
          },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        isDense: true,
        filled: true,
        hintText: textHint,
        hintStyle: style ??
            UTextStyles.caption.copyWith(
              color: UColors.textHint,
              fontWeight: FontWeight.normal,
            ),
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: UColors.secondary,
            width: 2,
          ),
        ),
        helperText: dense ? '' : null,
        helperStyle: GoogleFonts.nunito(height: 0.8),
        errorStyle: GoogleFonts.nunito(height: 0.8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: UColors.border,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}

class CNominalTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final String? errorText;

  const CNominalTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      keyboardType: TextInputType.number,
      // cursorHeight: 20,
      style: UTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
      inputFormatters: [
        ThousandsSeparatorInputFormatter(),
      ],
      decoration: InputDecoration(
        errorText: errorText,
        errorStyle: UTextStyles.overline.copyWith(
          color: UColors.danger,
          height: 1,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
        filled: true,
        fillColor: Colors.white,
        prefix: Text(
          "Rp ",
          style: UTextStyles.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: UColors.border,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: UColors.secondary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: UColors.border,
            width: 2,
          ),
        ),
      ),
    );
  }
}
