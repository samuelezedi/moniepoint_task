import 'package:gap/gap.dart';

class AppSizes {
  // TODO: Rename all sizes according to design names
  static const double xs = 4;
  static const double s = 8;
  static const double xm = 12;
  static const double m = 16;
  static const double ml = 20;
  static const double l = 24;
  static const double xl = 32;
  static const double xxl = 40;
  static const double xxxl = 80;
}

// Gaps
const gapXSmall = Gap(AppSizes.xs);
const gapSmall = Gap(AppSizes.s);
const gapXMedium = Gap(AppSizes.xm);
const gapMedium = Gap(AppSizes.m);
const gapLarge = Gap(AppSizes.l);
const gapXLarge = Gap(AppSizes.xl);
const gapXXLarge = Gap(AppSizes.xxl);

// Widget Sizes
const double gruntMenuItemHeight = 60;
const double gruntDialogBorderRadius = 28;
const double gruntSmallButtonHeight = AppSizes.xl;
const double gruntNormalButtonHeight = 48;
const double gruntToolbarHeight = 44;
const double gruntToolbarButtonHeight = gruntToolbarHeight;

// Aspect Ratios
const double gruntHeroImageAspectRatio = 0.6;

// Durations
const shortestDuration = Duration(milliseconds: 133);
const shortDuration = Duration(milliseconds: 200);
