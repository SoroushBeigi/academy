import 'package:academy/src/features/lessons/presentation/cubit/lessons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(const LessonsState.initial());
  // final ValueNotifier<int> tabNotifier = ValueNotifier(0);
}
