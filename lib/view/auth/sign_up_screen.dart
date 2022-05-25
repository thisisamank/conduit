import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/constants/app_strings.dart';
import 'package:conduit/di/riverpod_dependency_manager.dart';
import 'package:conduit/routes/route_names.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:conduit/utils/text_field_validator.dart';
import 'package:conduit/widgets/buttons.dart';
import 'package:conduit/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.dark800,
      body: _buildBody(context, ref),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(mediumValue),
        child: Form(
          key: _key,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: largeValue),
                    child: Text(
                      AppStrings.createYourAccount,
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  vSizedBox4,
                  Padding(
                    padding: EdgeInsets.all(largeValue),
                    child: LabeledTextField(
                      validator: TextFieldValidator.emailValidate,
                      hintText: AppStrings.enterYourEmailAddress,
                      label: AppStrings.emailAddress,
                      textEditingController: _emailController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(largeValue),
                    child: LabeledTextField(
                      hintText: AppStrings.enterYourUsername,
                      label: AppStrings.username,
                      textEditingController: _usernameController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(largeValue),
                    child: LabeledTextField(
                      hintText: AppStrings.enterYourPassword,
                      label: AppStrings.password,
                      validator: TextFieldValidator.passwordValidate,
                      textEditingController: _passwordController,
                    ),
                  ),
                  vSizedBox8,
                  Center(
                    child: AppButton(
                      buttonText: AppStrings.signUp,
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          ref.watch(authNotifierProvider.notifier).signUp(
                                username: _usernameController.text,
                                emailId: _emailController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
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
                      GestureDetector(
                        onTap: () => context.go(AppRouteNames.loginScreen),
                        child: Text(
                          AppStrings.signIn,
                          style: AppTextStyles.p3Bold.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
