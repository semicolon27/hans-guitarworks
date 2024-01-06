import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tugas_crud/common/components/button.component.dart';
import 'package:tugas_crud/common/components/image.component.dart';
import 'package:tugas_crud/common/utils/styles.util.dart';

class ButtonAlertComponent extends StatelessWidget {
  final String? title;
  final Widget? widgetTitle;
  final String? message;
  final Widget? widgetMessage;
  final Widget? trigger;
  final String? buttonText;
  final Widget? footer;
  final Function(bool?)? onDismiss;

  const ButtonAlertComponent({
    super.key,
    this.title,
    this.message,
    this.trigger,
    this.buttonText,
    this.widgetTitle,
    this.widgetMessage,
    this.footer,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool? result = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60.sp,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  // biar full panjangnya
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: UColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: widgetTitle ??
                      Text(
                        title ?? "",
                        style: UTextStyles.h5.copyWith(
                          color: UColors.white,
                        ),
                      ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: UColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.all(20.sp),
                  child: widgetMessage ?? Text(message ?? ""),
                ),
                Padding(
                  padding: EdgeInsets.all(footer != null ? 10 : 0),
                  child: footer ?? const SizedBox(),
                ),
              ],
            ),
          ),
        );
        if (onDismiss != null) {
          onDismiss!(result);
        }
      },
      child: trigger ?? CButton(text: buttonText),
    );
  }
}

enum AlertType {
  success,
  error,
  warning,
  info,
}

class AlertComponent extends StatelessWidget {
  final String? title;
  final String? content;
  final TextStyle? contentTextStyle;
  final TextStyle? titleTextStyle;
  final String buttonText;
  final AlertType type;

  const AlertComponent({
    super.key,
    this.title,
    this.content,
    this.titleTextStyle,
    this.contentTextStyle,
    this.buttonText = 'OK',
    this.type = AlertType.info,
  });

  @override
  Widget build(BuildContext context) {
    Widget body() {
      if (type == AlertType.info) {
        return Text('$content');
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CImage(
              'assets/icons/success.png',
              height: 80.sp,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.sp),
            Text(
              '$content',
              style: UTextStyles.subtitle1,
            ),
          ],
        );
      }
    }

    return AlertDialog(
      title: title != null ? Text('$title') : null,
      content: body(),
      actions: <Widget>[
        CTextButton(
          widget: Text(
            buttonText,
            style: UTextStyles.body1.copyWith(
              fontWeight: FontWeight.bold,
              color: UColors.primary,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
      elevation: 1,
      titleTextStyle: titleTextStyle ??
          UTextStyles.body1.copyWith(
            fontWeight: FontWeight.bold,
          ),
      contentTextStyle: contentTextStyle ?? UTextStyles.body1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.sp)),
      ),
    );
  }
}

class AlertOptionComponent extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? content;
  final String? cancelText;
  final String? confirmText;
  final TextStyle? contentStyle;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final TextStyle? confirmStyle;
  final TextStyle? cancelStyle;
  final List<Widget>? actions;
  final Color confirmColor;
  final Color cancelColor;

  const AlertOptionComponent({
    super.key,
    this.title,
    this.content,
    this.titleStyle,
    this.confirmText,
    this.cancelText,
    this.contentStyle,
    this.confirmStyle,
    this.cancelStyle,
    this.actions,
    this.confirmColor = UColors.primary,
    this.cancelColor = UColors.textSecondary,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              '$title',
              style: UTextStyles.body1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      content: SingleChildScrollView(
        child: Text(
          '$content',
          style: UTextStyles.body1,
        ),
      ),
      actions: actions ??
          <Widget>[
            CTextButton(
              widget: Text(
                '$confirmText',
                style: confirmStyle ?? UTextStyles.body1.copyWith(color: confirmColor),
              ),
              onPressed: onConfirm ?? () => Get.back(result: true),
            ),
            if (cancelText != null)
              CTextButton(
                widget: Text(
                  '$cancelText',
                  style: cancelStyle ?? UTextStyles.body1.copyWith(color: cancelColor),
                ),
                onPressed: onCancel ?? () => Get.back(result: false),
              ),
          ],
      elevation: 1,
      titleTextStyle: titleStyle ?? UTextStyles.subtitle1,
      contentTextStyle: contentStyle ?? UTextStyles.subtitle2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }
}

Future<dynamic> openDialog(String? title, String subtitle) async {
  return await showDialog(
    context: Get.context!,
    builder: (BuildContext context) => AlertComponent(
      title: title,
      content: subtitle,
    ),
    barrierDismissible: false,
  );
}

Future<dynamic> openDialogConfirmation(String? title, String subtitle, confirmText, cancelText) async {
  return await showDialog(
    context: Get.context!,
    builder: (BuildContext context) => AlertOptionComponent(
      title: title,
      content: subtitle,
      confirmText: confirmText,
      cancelText: cancelText,
    ),
    barrierDismissible: false,
  );
}
