import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CommentsIcon extends StatelessWidget {
  const CommentsIcon({required this.commentCount, Key? key}) : super(key: key);
  final int commentCount;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Stack(
        children: [
          Icon(
            FeatherIcons.messageSquare,
            color: Colors.grey,
            size: 32.adjustSize,
          ),
          if (commentCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(smallValue / 1.3),
                ),
                height: 18.adjustSize,
                width: 20.adjustSize,
                child: Center(
                  child: Text(
                    '$commentCount',
                    style: AppTextStyles.p3Bold.copyWith(
                      fontSize: 12.adjustSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
