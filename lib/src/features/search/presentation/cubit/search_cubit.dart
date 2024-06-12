import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../home/presentation/bloc/home_cubit.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());

  Map<String,bool> chips={'Education':false,'Entertainment':false,'Music':false,'Nature':false,};

  void search(String value) {
    if (value == '' || value == ' ') {
      emit(const SearchState.initial());
      return;
    }
    final videos = HomeCubit.videos;
    final foundVideos = videos
        .where((element) => element.title?.contains(value) ?? false)
        .toList();

    emit(SearchState.foundVideos(foundVideos));
  }

  void switchChips(String key, bool value) {
    chips[key] = value;
    emit(const SearchState.initial());
    emit(SearchState.chipsChanged(chips));
  }
}
