import 'package:conduit/constants/app_assets.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppErrorWidget extends ConsumerWidget {
  const AppErrorWidget({
    Key? key,
    this.errorText = 'Something went wrong',
  }) : super(key: key);
  final String errorText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.error),
        Text(
          errorText,
          style: AppTextStyles.p3,
        ),
      ],
    );
  }
}
