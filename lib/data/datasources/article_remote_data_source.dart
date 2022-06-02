import 'dart:convert';
import 'package:aplikasi_berita/common/config.dart';
import 'package:aplikasi_berita/data/models/article_model.dart';
import 'package:aplikasi_berita/data/models/article_response.dart';
import 'package:aplikasi_berita/common/exception.dart';
import 'package:http/http.dart' as http;

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlineArticles();
  Future<List<ArticleModel>> getHeadlineBusinessArticles();
  Future<List<ArticleModel>> getArticleCategory(String category);
  Future<ArticleResponse> searchArticles(String query, int page);
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final http.Client client;
  ArticleRemoteDataSourceImpl({required this.client});
  @override
  Future<List<ArticleModel>> getTopHeadlineArticles() async {
    final response = await client.get(Uri.parse(
        '${baseUrl}top-headlines?country=$country&apiKey=$apiKey&pageSize=10'));
    if (response.statusCode == 200) {
      return ArticleResponse.fromJson(json.decode(response.body)).articles;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArticleModel>> getHeadlineBusinessArticles() async {
    final response = await client.get(Uri.parse(
        '${baseUrl}top-headlines?country=$country&category=business&apiKey=$apiKey&pageSize=20'));
    if (response.statusCode == 200) {
      return ArticleResponse.fromJson(json.decode(response.body)).articles;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArticleModel>> getArticleCategory(String category) async {
    final response = await client.get(Uri.parse(
        '${baseUrl}top-headlines?country=$country&category=$category&apiKey=$apiKey&pageSize=30'));
    if (response.statusCode == 200) {
      return ArticleResponse.fromJson(json.decode(response.body)).articles;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ArticleResponse> searchArticles(String query, int page) async {
    final response = await client.get(Uri.parse(
        '${baseUrl}everything?q=$query&apiKey=$apiKey&pageSize=$pageSize&page=$page'));
    if (response.statusCode == 200) {
      return ArticleResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
