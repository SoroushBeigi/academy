import 'dart:convert';

import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/mobile_video_details_page.dart';
import 'package:academy/src/features/video_details/presentation/pages/web_video_details_page.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/description_video.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/video_player_widget/video_player_widget.dart';
import 'package:academy/content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'widgets/comment_container.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({required this.entity, super.key});

  final ContentEntity entity;

  @override
  Widget build(BuildContext context) {
    callViewCount(contentId: entity.id!);
    return BlocProvider(
      create: (context) => getIt<VideoDetailsCubit>(),
      child: ResponsiveWidget(
        smallScreen: MobileVideoDetailsPage(entity: entity,),
        largeScreen: WebVideoDetailsPage(entity: entity,),
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
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
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
