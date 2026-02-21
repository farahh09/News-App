import 'package:injectable/injectable.dart';
import 'package:news/core/cache_helper.dart';
import 'package:news/core/repository/local/home_local_repo.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

@Injectable(as: HomeLocalRepo)
class HomeRepoLocalImpl extends HomeLocalRepo{
  @override
  Future<NewsResponse> getNews(String sourceId) async {
    var data = await CacheHelper.getNewsResponse(sourceId);
    return data ?? NewsResponse();
  }

  @override
  Future<SourcesResponse> getSources(String categoryId) async {
    var response = await CacheHelper.getSourceResponse(categoryId);
    return response ?? SourcesResponse();
  }
}