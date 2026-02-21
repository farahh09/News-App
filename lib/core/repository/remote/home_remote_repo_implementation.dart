import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api_manager.dart';
import 'package:news/core/cache_helper.dart';
import 'package:news/core/repository/remote/home_repo_remote.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

@Injectable(as: HomeRemoteRepo)
class HomeRepoRemoteImpl extends HomeRemoteRepo {
  ApiManager apiManager;

  HomeRepoRemoteImpl(this.apiManager);

  @override
  Future<SourcesResponse> getSources(String categoryId) async {
    try {
      Response response = await apiManager.get(
        "/v2/top-headlines/sources",
        queryParameters: {'category': categoryId},
      );

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      await CacheHelper.saveSourceResponse(sourcesResponse,categoryId);
      return sourcesResponse;
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<NewsResponse> getNews(String sourceId) async {
    try {
      Response response = await apiManager.get(
        "/v2/everything",
        queryParameters: {'sources': sourceId},
      );

      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      await CacheHelper.saveNewsResponse(newsResponse, sourceId);
      return newsResponse;
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
