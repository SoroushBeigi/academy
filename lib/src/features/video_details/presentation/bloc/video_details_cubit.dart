

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'video_details_state.dart';
part 'video_details_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<VideoDetailsState> {
  SplashCubit() : super(const VideoDetailsState.initial());

  

}