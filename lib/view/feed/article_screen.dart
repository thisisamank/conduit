import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/constants/app_strings.dart';
import 'package:conduit/models/articles.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:conduit/utils/date_time_convertor.dart';
import 'package:conduit/widgets/appbar.dart';
import 'package:conduit/widgets/buttons.dart';
import 'package:conduit/widgets/comment_icon.dart';
import 'package:conduit/widgets/profile_name_with_dp.dart';
import 'package:conduit/widgets/tag_pill.dart';
import 'package:conduit/widgets/text_field.dart';
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
      appBar: customAppBar(context: context, isBackButtonEnabled: true),
      backgroundColor: AppColors.dark800,
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final article = widget.article;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: largeValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileNameWithDP(
                username: article.author!.username,
                imageUrl: article.author!.image,
                subtitle: article.createdAt!.toFormattedString,
              ),
              const Spacer(),
              AppFlatButton(
                buttonText: AppStrings.follow,
                onPressed: () {},
              )
            ],
          ),
          vSizedBox6,
          Text(
            article.title,
            style: AppTextStyles.p1Bold.copyWith(
              fontSize: 18.adjustSize,
              color: AppColors.neutral50,
            ),
          ),
          vSizedBox3,
          SingleChildScrollView(
            child: Text(
              '${article.body}\n\n${article.description}',
              style: AppTextStyles.p2.copyWith(
                fontSize: 16.adjustSize,
                color: AppColors.neutral200,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              ...article.tagList
                  .map((value) => Padding(
                        padding: EdgeInsets.only(right: smallValue),
                        child: TagPill(text: value),
                      ))
                  .toList(),
            ],
          ),
          vSizedBox2,
          divider,
          vSizedBox2,
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AppTextField(
                  textController: TextEditingController(),
                  hintText: 'Add a comment',
                ),
              ),
              const Expanded(
                flex: 1,
                child: CommentsIcon(commentCount: 5),
              ),
              const Expanded(
                flex: 1,
                child: CommentsIcon(commentCount: 5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
