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
    this.subtitle,
    Key? key,
  }) : super(key: key);
  final String username;
  final String imageUrl;
  final String? subtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200.adjustSize),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: largeValue * 2.2,
          ),
        ),
        hSizedBox2,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: AppTextStyles.p2Bold.copyWith(
                color: AppColors.neutral300,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: AppTextStyles.p1.copyWith(
                  color: AppColors.neutral400,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
