import 'package:aplikasi_berita/common/failure.dart';
import 'package:aplikasi_berita/domain/entities/article.dart';
import 'package:aplikasi_berita/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

class GetArticleCategory {
  final ArticleRepository repository;
  GetArticleCategory(this.repository);
  Future<Either<Failure, List<Article>>> execute(String category) {
    return repository.getArticleCategory(category);
  }
}
