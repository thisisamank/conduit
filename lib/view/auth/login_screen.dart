import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/constants/app_strings.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.dark700,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Text(
          AppStrings.createYourAccount,
          style: AppTextStyles.h5.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
