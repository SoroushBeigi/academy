import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart%20';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/upload_video_repository.dart';
part 'add_state.dart';
part 'add_cubit.freezed.dart';


@Injectable()
class AddCubit extends Cubit<AddState> {

  UploadRepository uploadRepository;
  AddCubit(this.uploadRepository) : super(const AddState.initial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  static int? id = 0;
  static String? authorName= '';
  static String videoPath = '';

  var cameras;

  Future cameraVoid() async{
    emit(const AddState.loading(0));
    cameras  = await availableCameras();
    emit(const AddState.success());

  }

  Future<void> uploadVideo({File? videoFile, File? selectedImage}) async {
    if (videoFile != null && selectedImage != null) {
      String fileName = videoFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        "title": titleController.text,
        "description": descriptionController.text,
        "author_id": id ?? 1,
        "author_name": authorName ?? "soroush",
        "category_id": 2,
        "video": await MultipartFile.fromFile(videoFile.path, filename: fileName),
        "image": await MultipartFile.fromFile(selectedImage.path, filename: fileName),
      });
      emit(const AddState.loading(0));
      final result = await uploadRepository.uploadVideo(
          formData: formData,
          onSendProgress: (int sent, int total) {
            double progress = sent / total;
            emit(AddState.loading(progress));
          });
      result.whenOrNull(
        success: (data) {
          emit(const AddState.success());
        },
        failure: (error) {
          emit(AddState.error(errorMessage: error ?? ''));
        },
      );
    }
  }


}
