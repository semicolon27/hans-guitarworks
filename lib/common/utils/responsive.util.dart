import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResponsiveUtil {
  static double deviceHeight = Get.height;
  static double deviceWidth = Get.width;

  static double smallHeightSize = 500;
  static double mediumHeightSize = 800;
  static double bigHeightSize = 1000;

  static double smallWidthSize = 0;
  static double mediumWidthSize = 0;
  static double bigWidthSize = 0;

  static bool smallHeightUp = deviceHeight > smallHeightSize;
  static bool smallHeightDown = deviceHeight < smallHeightSize;
  static bool mediumHeightUp = deviceHeight > mediumHeightSize;
  static bool mediumHeightDown = deviceHeight < mediumHeightSize;
  static bool largeHeightUp = deviceHeight > bigHeightSize;
  static bool largeHeightDown = deviceHeight < bigHeightSize;

  static bool smallWidthUp = deviceWidth > smallWidthSize;
  static bool smallWidthDown = deviceWidth < smallWidthSize;
  static bool mediumWidthUp = deviceWidth > mediumWidthSize;
  static bool mediumWidthDown = deviceWidth < mediumWidthSize;
  static bool largeWidthUp = deviceWidth > bigWidthSize;
  static bool largeWidthDown = deviceWidth < bigWidthSize;

  static double defaultTabHeight =
      ScreenUtil().setHeight(smallHeightUp ? 50 : 70);
}
