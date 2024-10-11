import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';


// Note:
// There is no light theme for Grunt, so we only define the dark theme here.

final ColorScheme lightScheme = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
  primaryKey: AppColors.brandPrimary,
  primary: AppColors.brandPrimary,
  tones: FlexTones.material(Brightness.dark).monochromeSurfaces(),
);

final ThemeData appLightTheme = ThemeData(
  colorScheme: lightScheme,
  textTheme: TextTheme(
    headlineLarge: AppStyles.headline1,
    headlineMedium: AppStyles.headline2,
    headlineSmall: AppStyles.headline3,
    bodyLarge: AppStyles.headline4,
    bodyMedium: AppStyles.bodyMedium
  ),
  fontFamily: 'EuclidCircularA'
).copyWith(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.brandPrimary,
    foregroundColor: AppColors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.xs),
      ),
      overlayColor: AppColors.white,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.bg,
    titleTextStyle: AppStyles.headline1,
    contentTextStyle: AppStyles.bodyMedium.copyWith(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w400,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(gruntDialogBorderRadius),
    ),
    actionsPadding: const EdgeInsets.all(AppSizes.m),
  ),
);
