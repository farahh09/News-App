import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/bloc/states.dart';
import 'package:news/core/repository/home_repo.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitState());

  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  void changeSelectedSource(int index) {
    selectedIndex = index;
    emit(OnChangeSourceTab());
    getNewsData();
  }

  Future<void> getNewsData() async {
    emit(GetNewsDataLoadingState());

    try {
      NewsResponse newsResponse = await repo.getNews(
        sources[selectedIndex].id ?? '',
      );

      if (newsResponse.status == "error") {
        emit(GetNewsDataErrorState(newsResponse.message ?? ""));
        return;
      }

      articles = newsResponse.articles ?? [];
      emit(GetNewsDataSuccessState());
    } catch (e) {
      emit(GetNewsDataErrorState(e.toString()));
    }
  }

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoadingState());
    try {
      SourcesResponse sourcesResponse = await repo.getSources(categoryId);

      sources = sourcesResponse.sources ?? [];

      emit(GetSourcesSuccessState());
      getNewsData();
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }
}
