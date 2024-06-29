import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/logic/common/date_format.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../saved/domain/entity/content/response/content_response_entity.dart';

class DescriptionVideo extends StatelessWidget {
  const DescriptionVideo({required this.videoModel, super.key});

  final ContentResponseEntity videoModel;

  @override
  Widget build(BuildContext context) {



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${videoModel.viewCount ?? 24} views ${DateFormat.timeAgo(
                videoModel.createdAt ??
                    DateTime.now().subtract(
                      const Duration(days: 5),
                    ),
              )}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReadMoreText(
            '${videoModel.description ?? ''}\n',
            textAlign: AppConstants.isFa? TextAlign.right : TextAlign.left,
            trimMode: TrimMode.Line,
            trimLines: 2,
            trimCollapsedText: AppLocalizations.of(context).showMore,
            trimExpandedText: AppLocalizations.of(context).showLess,
            colorClickableText: Theme.of(context).colorScheme.primary,
          ),
        ),

      ],
    );
  }

}
