import 'package:academy/src/features/features.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());

  void search(String value) {
    print('value==$value');
    if (value == '' || value == ' ') {
      emit(const SearchState.initial());
      return;
    }
    final videos = HomeCubit.videos;
    print(videos);
    final foundVideos = videos
        .where((element) => element.title?.contains(value) ?? false)
        .toList();

    emit(SearchState.foundVideos(foundVideos));
  }
}
