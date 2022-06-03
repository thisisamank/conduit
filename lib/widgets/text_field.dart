import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.textController,
    required this.hintText,
    this.validator,
    this.suffix,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.neutral200,
      ),
      cursorHeight: extraLargeValue * 1.2,
      validator: validator,
      cursorColor: AppColors.primaryColor,
      controller: textController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(smallValue),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.p2.copyWith(
          color: AppColors.dark50,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(smallValue),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(extraLargeValue),
        fillColor: AppColors.dark700,
        filled: true,
        focusColor: AppColors.dark700,
        suffixIcon: suffix,
      ),
      // maxLines: 3,
      // minLines: 2,
    );
  }
}

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    Key? key,
    required this.hintText,
    required this.label,
    required this.textEditingController,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final String label;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: AppTextStyles.p3Bold.copyWith(
            color: AppColors.neutral100,
          ),
        ),
        vSizedBox2,
        AppTextField(
          validator: validator,
          textController: textEditingController,
          hintText: hintText,
        )
      ],
    );
  }
}
