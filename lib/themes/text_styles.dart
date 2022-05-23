import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/utils/size_config.dart';
import 'package:flutter/cupertino.dart';

extension AdaptiveSize on num {
  double get adjustSize =>
      ((SizeConfig.deviceHeight! * SizeConfig.deviceWidth!) / (414 * 896)) *
      this *
      100 *
      100;
}

class AppTextStyles {
  AppTextStyles._();

  static const String lightFont = 'AppFontLight';
  static const String regularFont = 'AppFontRegular';
  static const String mediumFont = 'AppFontMedium';
  static const String semiBoldFont = 'AppFontSemiBold';
  static const String boldFont = 'AppFontBold';

  // Heading styles
  static TextStyle get h1 => TextStyle(
        fontFamily: boldFont,
        fontSize: 60.adjustSize,
        height: 72.adjustSize,
        color: AppColors.neutral900,
      );

  static TextStyle get h1SemiBold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 60,
        height: 72,
        color: AppColors.neutral900,
      );

  static TextStyle get h2 => const TextStyle(
        fontFamily: boldFont,
        fontSize: 39,
        height: 47,
        color: AppColors.neutral900,
      );

  static TextStyle get h2SemiBold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 39,
        height: 47,
        color: AppColors.neutral900,
      );

  static TextStyle get h3 => const TextStyle(
        fontFamily: boldFont,
        fontSize: 33,
        height: 40,
        color: AppColors.neutral900,
      );

  static TextStyle get h3SemiBold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 33,
        height: 40,
        color: AppColors.neutral900,
      );

  static TextStyle get h4 => const TextStyle(
        fontFamily: boldFont,
        fontSize: 28,
        height: 34,
        color: AppColors.neutral900,
      );

  static TextStyle get h4SemiBold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 28,
        height: 34,
        color: AppColors.neutral900,
      );

  static TextStyle get h5 => TextStyle(
        fontFamily: boldFont,
        fontSize: 23.adjustSize,
        height: 28,
        color: AppColors.neutral900,
      );

  static TextStyle get h5SemiBold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 23,
        height: 28,
        color: AppColors.neutral900,
      );

  static TextStyle get h6 => const TextStyle(
        fontFamily: boldFont,
        fontSize: 19,
        height: 23,
        color: AppColors.neutral900,
      );

  static TextStyle get h6SemiBold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 19,
        height: 23,
        color: AppColors.neutral900,
      );

  // Paragraphs styles
  static TextStyle get p1 => const TextStyle(
        fontFamily: regularFont,
        fontSize: 14,
        height: 22,
        color: AppColors.neutral900,
      );

  static TextStyle get p1Bold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 14,
        height: 22,
        color: AppColors.neutral900,
      );

  static TextStyle get p2 => const TextStyle(
        fontFamily: regularFont,
        fontSize: 16,
        height: 22,
        color: AppColors.neutral900,
      );

  static TextStyle get p2Bold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 16,
        height: 22,
        color: AppColors.neutral900,
      );
  static TextStyle get p3 => const TextStyle(
        fontFamily: regularFont,
        fontSize: 18,
        height: 22,
        color: AppColors.neutral900,
      );

  static TextStyle get p3Bold => const TextStyle(
        fontFamily: semiBoldFont,
        fontSize: 18,
        height: 22,
        color: AppColors.neutral900,
      );
}
