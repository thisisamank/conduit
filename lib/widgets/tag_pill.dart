import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagPill extends ConsumerWidget {
  const TagPill({
    this.scale = 1,
    required this.text,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final String text;
  final double scale;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallValue * scale),
        color: AppColors.dark300,
      ),
      padding: EdgeInsets.all(smallValue * scale),
      child: Text(text, style: textStyle ?? AppTextStyles.p1),
    );
  }
}
