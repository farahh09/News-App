import 'package:news/core/repository/home_repo.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

class HomeRepoLocal extends HomeRepo{
  @override
  Future<NewsResponse> getNews(String categoryId) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String sourceId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}