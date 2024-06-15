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

import 'widgets/comment_container.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({required this.entity, super.key});

  final ContentEntity entity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VideoDetailsCubit>(),
      child: ResponsiveWidget(
        smallScreen: MobileVideoDetailsPage(entity: entity,),
        largeScreen: WebVideoDetailsPage(entity: entity,),
      ),
    );
  }

}
