import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'add_state.dart';
part 'add_cubit.freezed.dart';


@Injectable()
class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState.initial());


  var cameras;


  Future cameraVoid() async{
    emit(const AddState.loading());
    cameras  = await availableCameras();
    emit(const AddState.sucess());

  }
}
