import 'package:conduit/constants/app_colors.dart';
import 'package:conduit/di/riverpod_dependency_manager.dart';
import 'package:conduit/themes/app_dimensions.dart';
import 'package:conduit/themes/text_styles.dart';
import 'package:conduit/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  @override
  void initState() {
    Future.microtask(() {
      ref.refresh(articleNotifer);
      ref.watch(articleNotifer.notifier).fetchAllArticles();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final articleStates = ref.watch(articleNotifer);
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Feed",
        actions: [
          Padding(
            padding: EdgeInsets.all(smallValue),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mediumValue),
                color: AppColors.dark600,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 22.adjustSize,
                vertical: 8.adjustSize,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    width: 28.adjustSize,
                    height: 28.adjustSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(FeatherIcons.edit2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.dark800,
      body: articleStates.when(
        data: (data) {
          return ListView.separated(
            padding: EdgeInsets.all(mediumValue),
            itemBuilder: (context, index) {
              final article = data.articles[index];
              return Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200.adjustSize),
                        child: Image.network(
                          article.author!.image,
                          scale: 3.3,
                        ),
                      ),
                      hSizedBox2,
                      Text(
                        article.author!.username,
                        style: AppTextStyles.p2.copyWith(
                          color: AppColors.neutral300,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(smallValue),
                          color: AppColors.dark300,
                        ),
                        padding: EdgeInsets.all(smallValue),
                        child:
                            Text(article.tagList[0], style: AppTextStyles.p1),
                      ),
                      hSizedBox2,
                      Text(
                        "${article.createdAt!.day}/${article.createdAt!.month}/${article.createdAt!.year}",
                        style: AppTextStyles.p1,
                      ),
                    ],
                  ),
                  vSizedBox3,
                  Text(
                    article.body,
                    style: AppTextStyles.p2Bold,
                  ),
                  vSizedBox1,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .watch(articleNotifer.notifier)
                              .changefavouriteStatusOfArticle(article.slug);
                        },
                        icon: Icon(
                          article.favorited
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined,
                          color: AppColors.neutral300,
                        ),
                      ),
                      Text(
                        article.favoritesCount.toString(),
                        style: AppTextStyles.p3
                            .copyWith(color: AppColors.neutral300),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.bookmark,
                            color: AppColors.neutral300,
                          ))
                    ],
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => vSizedBox5,
            itemCount: data.articlesCount,
          );
        },
        loading: () => const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        )),
        error: (_, __) => const Text("error"),
      ),
    );
  }
}