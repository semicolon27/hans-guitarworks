import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tugas_crud/common/utils/math.util.dart';
import 'package:google_fonts/google_fonts.dart';

class UColors {
  static const Color primary = Color(0xff0B6E45);
  static const Color primaryVariant = Color.fromARGB(255, 7, 79, 49);
  static const Color onPrimary = Color.fromARGB(255, 7, 79, 49);
  static const Color border = Color.fromARGB(255, 77, 77, 77);
  static const Color white = Color(0xffffffff);
  static const Color gray = Color(0xffC5C5C5);

  static const Color secondary = Color(0xffFBBA30);
  static const Color secondaryVariant = Color.fromARGB(255, 211, 152, 24);
  static const Color onSecondary = Color.fromARGB(255, 211, 152, 24);

  static const Color textPrimary = Color(0xff181818);
  static const Color textSecondary = Color.fromARGB(255, 139, 139, 139);
  static const Color textLight = Color(0xfffbfbfb);
  static const Color textHint = Color(0xffD2D2D2);

  static const Color success = Color.fromARGB(255, 56, 196, 44);
  static const Color warning = Color.fromARGB(255, 242, 181, 48);
  static const Color danger = Color(0xfff24630);

  static const Color textButtonPrimary = Color(0xffffffff);
  static const Color textButtonSecondary = Color(0xffffffff);

  static const Color backgroundGrey = Color(0xfff8f8f8);

  static Map<int, Color> swatches = {
    50: primary.withOpacity(.1),
    100: primary.withOpacity(.2),
    200: primary.withOpacity(.3),
    300: primary.withOpacity(.4),
    400: primary.withOpacity(.5),
    500: primary.withOpacity(.6),
    600: primary.withOpacity(.7),
    700: primary.withOpacity(.8),
    800: primary.withOpacity(.9),
    900: primary.withOpacity(1),
  };

  static MaterialColor primaryMaterial = MaterialColor(primary.value, swatches);
}

class UTextStyles extends TextStyle {
  static const bool fontScaling = false;
  static const double letterSpace = 0.5;
  static const double normalSize = 12.5;
  static const double normalh4Size = 11.5;
  static const double normalh3Size = 13.5;
  static const double boldSize = 15.5;

  static double fontSizeH1 = MathUtil.percent(96.0, 14);
  static double fontSizeH2 = MathUtil.percent(60.0, 14);
  static double fontSizeH3 = MathUtil.percent(48.0, 14);
  static double fontSizeH4 = MathUtil.percent(34.0, 14);
  static double fontSizeH5 = MathUtil.percent(30.0, 14);
  static double fontSizeH6 = MathUtil.percent(28.0, 14);
  static double fontSizeSubtitle1 = MathUtil.percent(24.0, 14);
  static double fontSizeSubtitle2 = MathUtil.percent(24.0, 14);
  static double fontSizeBody1 = MathUtil.percent(20.0, 14);
  static double fontSizeBody2 = MathUtil.percent(20.0, 14);
  static double fontSizeCaption = MathUtil.percent(18, 14);
  static double fontSizeOverline = MathUtil.percent(16, 14);

  static const double letterSpaceH1 = -1.5;
  static const double letterSpaceH2 = -0.5;
  static const double letterSpaceH3 = 0;
  static const double letterSpaceH4 = 0.25;
  static const double letterSpaceH5 = 0;
  static const double letterSpaceH6 = 0.15;
  static const double letterSpaceSubtitle1 = 0.15;
  static const double letterSpaceSubtitle2 = 0.1;
  static const double letterSpaceBody1 = 0;
  static const double letterSpaceBody2 = 0;
  static const double letterSpaceButton = 1.25;
  static const double letterSpaceCaption = 0;
  static const double letterSpaceOverline = 1.5;

  static TextStyle h1 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceH1,
    fontSize: fontSizeH1.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle h2 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceH2,
    fontSize: fontSizeH2.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle h3 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceH3,
    fontSize: fontSizeH3.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle h4 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceH4,
    fontSize: fontSizeH4.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle h5 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceH5,
    fontSize: fontSizeH5.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle h6 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceH6,
    fontSize: fontSizeH6.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle subtitle1 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceSubtitle1,
    fontSize: fontSizeSubtitle1.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle subtitle2 = GoogleFonts.nunito(
    color: UColors.textSecondary,
    letterSpacing: letterSpaceSubtitle2,
    fontSize: fontSizeSubtitle2.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body1 = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceBody1,
    fontSize: fontSizeBody1.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body2 = GoogleFonts.nunito(
    color: UColors.textSecondary,
    letterSpacing: letterSpaceBody1,
    fontSize: fontSizeBody1.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle button = GoogleFonts.nunito(
    color: UColors.textButtonPrimary,
    letterSpacing: letterSpaceButton,
    fontSize: fontSizeBody1.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle caption = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceCaption,
    fontSize: fontSizeCaption.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle overline = GoogleFonts.nunito(
    color: UColors.textPrimary,
    letterSpacing: letterSpaceCaption,
    fontSize: fontSizeOverline.sp,
    fontWeight: FontWeight.w500,
  );
}

class USize {
  static double heightBetweenField = 0.sp;
}

class UBoxDecorations {
  static BorderRadius borderRadiusAll = BorderRadius.circular(10.sp);

  static BoxDecoration defaultCardDecoration = BoxDecoration(
    color: UColors.secondary,
    borderRadius: borderRadiusAll,
    boxShadow: defaultCardShadow,
  );

  // styling card / container
  static List<BoxShadow> defaultCardShadow = [
    const BoxShadow(
      color: Color(0x29000000),
      offset: Offset(0, 3),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];
}
