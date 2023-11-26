import 'package:flutter/cupertino.dart';

class Dimen {
  static const mobileEndWidth = 480;
  static const tabletEndWidth = 800;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width > 0 &&
        MediaQuery.of(context).size.width <= mobileEndWidth;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > mobileEndWidth &&
        MediaQuery.of(context).size.width <= tabletEndWidth;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > tabletEndWidth;
  }

  static double getCurrentWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getProfilePicRadius(BuildContext context) {
    if (isMobile(context)) return getCurrentWidth(context) * 0.15;
    return getCurrentWidth(context) * 0.1;
  }

  static int getProjectItemInARow(BuildContext context) {
    if (!isMobile(context)) return getCurrentWidth(context) ~/ 400;
    return 1;
  }
}
