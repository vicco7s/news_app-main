import 'package:aplikasi_berita/domain/repositories/article_repository.dart';

class GetBookmarkStatus {
  final ArticleRepository repository;
  GetBookmarkStatus(this.repository);
  Future<bool> execute(String url) async {
    return repository.isAddedToBookmarkArticle(url);
  }
}
