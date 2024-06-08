import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';


part 'video_details_state.dart';
part 'video_details_cubit.freezed.dart';

@injectable
class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  VideoDetailsCubit() : super(const VideoDetailsState.initial());

  static String url = '';

}