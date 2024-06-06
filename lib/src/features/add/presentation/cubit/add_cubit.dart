import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:image_picker/image_picker.dart';

part 'add_state.dart';
part 'add_cubit.freezed.dart';


class AddCubit extends Cubit<AddState> {
  // XFile? xFile;
  AddCubit() : super(const AddState.initial());

  Future<void> getFile()async{
    print('reached');
    // final ImagePicker picker = ImagePicker();
    // final XFile? image = await picker.pickVideo(source: ImageSource.gallery);
  }
}
