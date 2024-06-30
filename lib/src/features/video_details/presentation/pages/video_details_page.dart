import 'dart:convert';

import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/saved/domain/entity/content/response/content_response_entity.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/mobile_video_details_page.dart';
import 'package:academy/src/features/video_details/presentation/pages/web_video_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class VideoDetails extends StatelessWidget {
  const VideoDetails({required this.entity, super.key});

  final ContentResponseEntity entity;

  @override
  Widget build(BuildContext context) {
    if(entity.id!=null){
      callViewCount(contentId: entity.id!);
    }
    return ResponsiveWidget(
      smallScreen: MobileVideoDetailsPage(
        entity: entity,
      ),
      largeScreen: WebVideoDetailsPage(
        entity: entity,
      ),
    );
  }
}

Future<void> callViewCount({required int contentId}) async {
  final url = '${AppConstants.baseUrl}/content/view/$contentId';
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'id': contentId,
  });

  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      print('View Count added successfully');
      // Optionally, handle success (e.g., update UI, notify user, etc.)
    } else {
      print('Failed to add view count: ${response.statusCode}');
      // Optionally, handle the error (e.g., show a message to the user)
    }
  } catch (e) {
    print('Error adding view count: $e');
    // Optionally, handle network or other errors
  }
}
