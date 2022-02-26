class ApiEndpoints {
  ApiEndpoints._();

  static const int paginationLimit = 10;

  static const String baseUrl = "https://api.realworld.io/api";

  // User URLs
  static const String userUrl = "$baseUrl/user";
  static const String loginUrl = "$baseUrl/users/login";
  static const String registerUrl = "$baseUrl/users";

  // Profile URLs
  static const String profileUrl = "$baseUrl/profiles";
  static String getProfile({required String userName}) =>
      "$baseUrl/profiles/$userName";
  static String toggleFollowingUrl({required String userName}) =>
      "$baseUrl/profiles/$userName/follow";

  //Article URLs
  static const String feedArticlesUrl = "$baseUrl/articles/feed";
  static const String articlesUrl = "$baseUrl/articles";
  static String articleFromSlugUrl({required String slug}) =>
      "$baseUrl/articles/$slug";

  //Comments URLs
  static String commentsOnArticleUrl({required String slug}) =>
      "$baseUrl/articles/$slug/comments";
  static String deleteCommentOnArticleUrl(
          {required String slug, required String id}) =>
      "$baseUrl/articles/$slug/comments/$id";

  //Favorites URLs
  static String favouritesArticleUrl({required String slug}) =>
      "$baseUrl/articles/$slug/favorite";

  // Tags
  static const String getTagsUrl = "$baseUrl/tags";
}
