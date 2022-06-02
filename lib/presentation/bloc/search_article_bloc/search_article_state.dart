part of 'search_article_bloc.dart';

abstract class SearchArticleState extends Equatable {
  const SearchArticleState();
  @override
  List<Object> get props => [];
}

class SearchArticleInitial extends SearchArticleState {}

class SearchArticleEmpty extends SearchArticleState {
  final String message;
  SearchArticleEmpty(this.message);
  @override
  List<Object> get props => [message];
}

class SearchArticleLoading extends SearchArticleState {}

class SearchArticleHasData extends SearchArticleState {
  final List<Article> searchResult;
  final int totalResults;
  final int currentPage;
  SearchArticleHasData(
    this.searchResult,
    this.totalResults,
    this.currentPage,
  );
  @override
  List<Object> get props => [searchResult, totalResults, currentPage];
}

class SearchArticleError extends SearchArticleState {
  final String message;
  SearchArticleError(this.message);
  @override
  List<Object> get props => [message];
}
