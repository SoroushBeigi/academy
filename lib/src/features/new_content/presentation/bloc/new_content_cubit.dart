

import 'package:academy/src/features/new_content/domain/entity/category/response/category_response_entity.dart';
import 'package:academy/src/features/new_content/domain/repository/category/get_category_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import '../../../saved/domain/entity/content/response/content_response_entity.dart';
import '../../domain/repository/content/get_all_content.dart';
import 'new_content_state.dart';

@injectable
class NewContentCubit extends Cubit<NewContentState> {
  NewContentCubit(this.getCategoryRepository, this.getAllContentRepository) : super(const NewContentState.idle());

  final GetAllContentRepository getAllContentRepository;
  final formKey = GlobalKey<FormState>();
  final videoTitle = TextEditingController();
  final videoDescription = TextEditingController();
  final authorNameController = TextEditingController();
  int authorId = 1;
  List<String> tags = [];
  List<int> categoryIds = [];
  List<int> relatedIds = [];
  FilePickerResult? mainFileResult;
  FilePickerResult? imageFileResult;
  List<FilePickerResult?> attachmentResults = [];


  GetCategoryRepository getCategoryRepository;

  List<CategoryResponseEntity> categoryList = [];

  Map<String, int> allCategoryMap = {};
  Map<String, int> categoryMap = {};
  Map<String, int> contentsMap = {};
  Map<String, int> allContentsMap = {};

  List<ContentResponseEntity> allContentsList = [];
  List<ContentResponseEntity> approvedContentsList = [];



  Future getCategories() async{
    categoryList.clear();
    emit(const NewContentState.loading());
    final result = await getCategoryRepository.getCategory();
    result.whenOrNull(
      success: (data) {
        for(var i in data) {
          categoryList.add(i);
        }
        allCategoryMap = categoryList.fold({}, (Map<String, int> map, CategoryResponseEntity categoryEntity) {
          map[categoryEntity.name ?? ''] = categoryEntity.id ?? 1;
          return map;
        });
        emit(const NewContentState.success());
      },
      failure: (error) {
        emit(NewContentState.error(errorMessage: error ?? ''));
      },
    );
  }


  Future createContent({required Function(int) onProgress}) async {
    emit(const NewContentState.loadingAddNewContent(progress: 0));
    print('Creating content...');

    final request = http.MultipartRequest('POST', Uri.parse('http://172.16.251.80:8080/content/upload_new'));
    request.fields['title'] = videoTitle.text;
    request.fields['description'] = videoDescription.text;
    request.fields['author_id'] = authorId.toString();
    request.fields['author_name'] = 'admin';
    request.fields['tags'] = jsonEncode(tags);
    request.fields['category_ids'] = categoryIds.join(',');
    request.fields['related_content_ids'] = relatedIds.join(',');

    if (mainFileResult != null) {
      final mainFile = mainFileResult!.files.single;
      request.files.add(http.MultipartFile.fromBytes(
        'main_file',
        mainFile.bytes!,
        filename: mainFile.name,
        contentType: MediaType('application', 'octet-stream'),
      ));
    }

    if (imageFileResult != null) {
      final imageFile = imageFileResult!.files.single;
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        imageFile.bytes!,
        filename: imageFile.name,
        contentType: MediaType('application', 'octet-stream'),
      ));
    }

    for (int i = 0; i < attachmentResults.length; i++) {
      if (attachmentResults[i] != null) {
        final attachmentFile = attachmentResults[i]!.files.single;
        request.files.add(http.MultipartFile.fromBytes(
          'attachment_${i + 1}',
          attachmentFile.bytes!,
          filename: attachmentFile.name,
          contentType: MediaType('application', 'octet-stream'),
        ));
      }
    }

    try {
      final streamedResponse = await request.send();
      final totalBytes = streamedResponse.contentLength ?? 0;
      int bytesUploaded = 0;
      streamedResponse.stream.listen(
            (chunk) {
          bytesUploaded += chunk.length;
          final progress = ((bytesUploaded / totalBytes) * 100).toInt();
          onProgress(progress);
          emit(NewContentState.loadingAddNewContent(progress: progress));
        },
        onDone: () {
          print('Content upload complete');
          emit(const NewContentState.successAddNewContent());
        },
        onError: (e) {
          print('Error during upload: $e');
        },
      );
      if (streamedResponse.statusCode == 200) {
        print('Content created successfully');
        emit(const NewContentState.successAddNewContent());
      } else {
        print('Failed to create content: ${streamedResponse.reasonPhrase}');
      }
    } catch (e) {
      print('Error sending request: $e');
    }
  }

  Future getAllContents() async{
    allContentsList.clear();
    approvedContentsList.clear();
    emit(const NewContentState.loading());
    final result = await getAllContentRepository.getAllContent();
    result.whenOrNull(
      success: (data) async{
        for(var i in data) {
          allContentsList.add(i);
        }
        for (var item in allContentsList){
          if (item.isApproved == true){
            approvedContentsList.add(item);
          }
        }
        allContentsMap = approvedContentsList.fold({}, (Map<String, int> map, ContentResponseEntity contentEntity) {
          map[contentEntity.title ?? ''] = contentEntity.id ?? 1;
          return map;
        });
        await getCategories();
      },
      failure: (error) {
        emit(NewContentState.error(errorMessage: error ?? ''));
      },
    );
  }

}