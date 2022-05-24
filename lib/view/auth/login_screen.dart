import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/constants/app_strings.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:conduit/widgets/buttons.dart';
import 'package:conduit/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.dark800,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(mediumValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.createYourAccount,
              style: AppTextStyles.h5.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            vSizedBox4,
            Padding(
              padding: EdgeInsets.all(largeValue),
              child: LabeledTextField(
                hintText: AppStrings.enterYourEmailAddress,
                label: AppStrings.emailAddress,
                textEditingController: _emailController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(largeValue),
              child: LabeledTextField(
                hintText: AppStrings.enterYourPassword,
                label: AppStrings.password,
                textEditingController: _passwordController,
              ),
            ),
            vSizedBox8,
            Center(
              child: AppButton(
                buttonText: AppStrings.signUp,
                onPressed: () {},
              ),
            ),
            vSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.alreadyHaveAnAccount,
                  style: AppTextStyles.p3.copyWith(
                    color: AppColors.dark50,
                  ),
                ),
                hSizedBox2,
                Text(
                  AppStrings.signUp,
                  style: AppTextStyles.p3Bold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            vSizedBox10,
          ],
        ),
      ),
    );
  }
}
