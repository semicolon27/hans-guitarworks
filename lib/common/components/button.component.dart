// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tugas_crud/common/utils/responsive.util.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';

class CButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? text;
  final Color? primary;
  final Color? onPrimary;
  final Color? onSurface;
  final bool loading;

  const CButton({
    super.key,
    this.child,
    this.text,
    this.onPressed,
    this.primary,
    this.onPrimary,
    this.onSurface,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: onPrimary ?? UColors.white,
        backgroundColor: primary ?? UColors.primary,
        elevation: 0,
        disabledForegroundColor: onSurface ?? UColors.secondaryVariant.withOpacity(0.38),
        disabledBackgroundColor: onSurface ?? UColors.secondaryVariant.withOpacity(0.12),
        minimumSize: Size(
          ScreenUtil().screenWidth,
          ScreenUtil().setHeight(ResponsiveUtil.smallHeightDown ? 50 : 40),
        ),
        padding: const EdgeInsets.symmetric(),
      ),
      onPressed: loading ? null : onPressed,
      child: loading
          ? const CupertinoActivityIndicator()
          : child ??
              Text(
                text ?? "",
                style: UTextStyles.subtitle1.copyWith(
                  color: UColors.textLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
    );
  }
}

class CButtonIcon extends StatelessWidget {
  final Widget icon;
  final Widget child;
  final VoidCallback? onPressed;
  final Color? primary;
  final Color? onPrimary;
  final Color? onSurface;
  final bool loading;

  const CButtonIcon({
    super.key,
    required this.icon,
    required this.child,
    this.onPressed,
    this.primary,
    this.onPrimary,
    this.onSurface,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      style: ElevatedButton.styleFrom(
        foregroundColor: onPrimary ?? UColors.onSecondary,
        backgroundColor: primary ?? UColors.secondary,
        elevation: 0,
        disabledForegroundColor: onSurface ?? UColors.secondaryVariant.withOpacity(0.38),
        disabledBackgroundColor: onSurface ?? UColors.secondaryVariant.withOpacity(0.12),
        minimumSize: Size(
          ScreenUtil().screenWidth,
          ScreenUtil().setHeight(ResponsiveUtil.smallHeightDown ? 50 : 40),
        ),
        padding: const EdgeInsets.symmetric(),
      ),
      label: child,
      onPressed: loading ? null : onPressed,
    );
  }
}

class CTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? widget;
  final String? text;

  const CTextButton({
    super.key,
    this.widget,
    this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(
          left: 2,
          right: 5,
        ),
        minimumSize: Size(
          ScreenUtil().screenWidth,
          ScreenUtil().setHeight(ResponsiveUtil.smallHeightDown ? 50 : 40),
        ),
      ),
      onPressed: onPressed,
      child: text != null
          ? Text(
              text!,
              style: UTextStyles.subtitle1.copyWith(
                color: UColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            )
          : (widget ?? const Text("")),
    );
  }
}

class CTextLink extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final double? fontSize;

  const CTextLink({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = UColors.textPrimary,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: UColors.secondary,
            width: 2,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: UTextStyles.body1.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? UTextStyles.fontSizeBody1.sp,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class CButtonOutlined extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final Color color;

  const CButtonOutlined({
    super.key,
    this.child,
    this.onPressed,
    this.color = UColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: UColors.secondary,
        side: BorderSide(width: 2.0, color: color),
        padding: EdgeInsets.symmetric(
          horizontal: 20.sp,
          vertical: 10.sp,
        ),
        minimumSize: Size(
          ScreenUtil().screenWidth,
          ScreenUtil().setHeight(ResponsiveUtil.smallHeightDown ? 50 : 40),
        ),
      ),
      onPressed: onPressed,
      child: child ?? const Text(""),
    );
  }
}

class CButtonOutlinedIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Widget icon;
  final Color color;

  const CButtonOutlinedIcon({
    super.key,
    required this.child,
    required this.icon,
    this.onPressed,
    this.color = UColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: icon,
      style: OutlinedButton.styleFrom(
        foregroundColor: UColors.secondary,
        side: BorderSide(width: 2.0, color: color),
        padding: EdgeInsets.symmetric(
          horizontal: 20.sp,
          vertical: 10.sp,
        ),
        minimumSize: Size(
          ScreenUtil().screenWidth,
          ScreenUtil().setHeight(ResponsiveUtil.smallHeightDown ? 50 : 40),
        ),
      ),
      label: child,
      onPressed: onPressed,
    );
  }
}

class CRadioButton<T> extends StatelessWidget {
  final String title;
  final bool isToggle;
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final Widget? trailing;
  final Widget? subtitle;

  const CRadioButton({
    super.key,
    required this.title,
    this.isToggle = true,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.trailing,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged == null) return;
        if (value == groupValue && isToggle) {
          onChanged!(null);
        } else {
          onChanged!(value);
        }
      },
      child: ListTile(
        title: Text(
          title,
          style: UTextStyles.body1,
        ),
        dense: true,
        subtitle: subtitle,
        leading: Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        trailing: trailing,
      ),
    );
  }
}

Widget buttonKecil({VoidCallback? onPressed, String? text}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: UColors.onSecondary,
      backgroundColor: UColors.secondary,
      elevation: 0,
      disabledForegroundColor: UColors.secondaryVariant.withOpacity(0.38),
      disabledBackgroundColor: UColors.secondaryVariant.withOpacity(0.12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
    ),
    onPressed: onPressed,
    child: Text(
      text ?? "",
      style: UTextStyles.button,
    ),
  );
}
