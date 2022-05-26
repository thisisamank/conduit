import 'package:cached_network_image/cached_network_image.dart';
import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileNameWithDP extends ConsumerWidget {
  const ProfileNameWithDP({
    required this.username,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final String username;
  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200.adjustSize),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: largeValue * 3,
          ),
        ),
        hSizedBox2,
        Text(
          username,
          style: AppTextStyles.p2.copyWith(
            color: AppColors.neutral300,
          ),
        ),
      ],
    );
  }
}
