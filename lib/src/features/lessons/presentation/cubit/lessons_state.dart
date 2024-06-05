import 'package:freezed_annotation/freezed_annotation.dart';
part 'lessons_state.freezed.dart';

@freezed
abstract class LessonsState with _$LessonsState {
  const factory LessonsState.initial() = _Initial;
}
