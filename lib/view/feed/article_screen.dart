import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/constants/app_strings.dart';
import 'package:conduit/models/articles.dart';
import 'package:conduit/utils/date_time_convertor.dart';
import 'package:conduit/widgets/buttons.dart';
import 'package:conduit/widgets/profile_name_with_dp.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleScreen extends ConsumerStatefulWidget {
  const ArticleScreen(this.article, {Key? key}) : super(key: key);
  final Article article;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends ConsumerState<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark900,
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final article = widget.article;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileNameWithDP(
              username: article.author!.username,
              imageUrl: article.author!.image,
              subtitle: article.createdAt!.toFormattedString,
            ),
            AppFlatButton(
              buttonText: AppStrings.follow,
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
