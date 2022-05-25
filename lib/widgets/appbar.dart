import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';

AppBar customAppBar({
  required BuildContext context,
  String? title,
  bool isBackButtonEnabled = false,
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
        : isBackButtonEnabled
            ? IconButton(
                onPressed: context.pop,
                icon: Icon(
                  FeatherIcons.arrowLeft,
                  color: AppColors.neutral100,
                  size: 28.adjustSize,
                ),
              )
            : const SizedBox.shrink(),
    actions: actions,
    backgroundColor: AppColors.dark800,
    elevation: 0,
    surfaceTintColor: AppColors.dark800,
  );
}
