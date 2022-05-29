import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:conduit/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.height,
    this.width,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? SizeConfig.deviceWidth! * 93,
      height: height ?? SizeConfig.deviceHeight! * 6,
      color: AppColors.primaryColor,
      textColor: AppColors.neutral100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(smallValue),
      ),
      child: Text(
        buttonText,
        style: AppTextStyles.p3Bold.copyWith(
          color: AppColors.neutral100,
        ),
      ),
    );
  }
}

class AppFlatButton extends StatelessWidget {
  const AppFlatButton({
    Key? key,
    this.height,
    this.width,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? SizeConfig.deviceWidth! * 15,
      height: height ?? SizeConfig.deviceHeight! * 5,
      color: AppColors.dark600,
      textColor: AppColors.neutral100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(smallValue),
      ),
      child: Text(
        buttonText,
        style: AppTextStyles.p2.copyWith(
          color: AppColors.neutral100,
        ),
      ),
    );
  }
}
