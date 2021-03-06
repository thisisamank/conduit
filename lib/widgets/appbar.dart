import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    title: title != null
        ? Text(
            title,
            style: AppTextStyles.h4SemiBold.copyWith(
              color: AppColors.neutral100,
            ),
          )
        : const SizedBox.shrink(),
    actions: actions,
    backgroundColor: AppColors.dark800,
    elevation: 0,
    surfaceTintColor: AppColors.dark800,
  );
}
