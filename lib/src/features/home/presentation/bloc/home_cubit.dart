import 'package:academy/src/core/services/grpc_service.dart';
import 'package:academy/src/core/services/lib/protos/course.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  //TODO: Test and implement the function
  Future<GetCoursesResponse> getCourses() async{
    final service = GrpcService.instance;
    final response = await service.coursesClient.getCourses(GetCoursesRequest());
    await service.closeChannel();
    return response;
  }
}
