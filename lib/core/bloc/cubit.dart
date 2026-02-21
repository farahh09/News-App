import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/bloc/states.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/core/repository/local/home_local_repo.dart';
import 'package:news/core/repository/remote/home_repo_remote.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeRemoteRepo repo;
  HomeLocalRepo localRepo;

  HomeCubit(this.repo, this.localRepo) : super(HomeInitState());
  List<Sources> sources = [];
  List<Articles> articles = [];
  List<Articles> filteredArticles = [];
  int selectedIndex = 0;


  void changeSelectedSource(int index) {
    selectedIndex = index;
    emit(OnChangeSourceTab());
    getNewsData();
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      filteredArticles = articles;
    } else {
      filteredArticles = articles.where((article) {
        var searchQuery = query.trim().toLowerCase();

        return (article.title?.toLowerCase().contains(searchQuery) ?? false)
            || (article.description?.toLowerCase().contains(searchQuery) ?? false)
            || (article.author?.toLowerCase().contains(searchQuery) ?? false);

      }).toList();
    }
    emit(SearchArticlesState());
  }
  Future<void> getNewsData() async {
    emit(GetNewsDataLoadingState());

    try {
      NewsResponse newsResponse = InternetConnectivity().isConnected
          ? await repo.getNews(sources[selectedIndex].id ?? "")
          : await localRepo.getNews(sources[selectedIndex].id ?? "");

      if (newsResponse.status == "error") {
        emit(GetNewsDataErrorState(newsResponse.message ?? ""));
        return;
      }

      articles = newsResponse.articles ?? [];
      filteredArticles = articles;
      emit(GetNewsDataSuccessState());
    } catch (e) {
      emit(GetNewsDataErrorState(e.toString()));
    }
  }

  Future<void> getSources(String categoryId) async {
    sources = [];
    articles = [];
    filteredArticles = [];
    selectedIndex = 0;
    emit(GetSourcesLoadingState());
    try {
      SourcesResponse sourcesResponse = InternetConnectivity().isConnected
          ? await repo.getSources(categoryId)
          : await localRepo.getSources(categoryId);

      sources = sourcesResponse.sources ?? [];

      emit(GetSourcesSuccessState());
      getNewsData();
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }
}
