import 'package:conduit/models/comments.dart';
import 'package:conduit/repository/article_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentsNotifier extends StateNotifier<AsyncValue<TotalComments>> {
  CommentsNotifier(this._articleRepository) : super(const AsyncValue.loading());
  final BaseArticleRepository _articleRepository;

  Future<void> fetchComments(String slug) async {
    final commentsStatus = await _articleRepository.fetchComment(slug);
    state = commentsStatus.fold(
      (comments) => AsyncValue.data(comments),
      (failure) => AsyncValue.error(failure),
    );
  }

  Future<void> postComment(String slug, String comment) async {
    final comments = state.value;
    final commentStatus = await _articleRepository.addComment(slug, comment);
    state = commentStatus.fold(
        (comment) => AsyncValue.data(comments!..comments.add(comment)),
        (failure) => AsyncValue.error(failure));
  }
}
