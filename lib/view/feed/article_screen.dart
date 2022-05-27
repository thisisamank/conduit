import 'package:conduit/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen(this.article, {Key? key}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
