import 'package:academy/src/features/favourite/presentation/cubit/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(const FavouriteState.initial());
}
