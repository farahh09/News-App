import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

abstract class HomeLocalRepo {
  Future<SourcesResponse> getSources(String categoryId);

  Future<NewsResponse> getNews(String sourceId);
}