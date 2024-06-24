import 'dart:convert';

import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/logic/common/date_format.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/video_details/presentation/bloc/video_details_cubit.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/related_video/related_video_container.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/video_player_widget/video_player_widget.dart';
import 'package:academy/content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:http/http.dart' as http;

class WebVideoDetailsPage extends StatefulWidget {
  const WebVideoDetailsPage({required this.entity, super.key});

  final ContentEntity entity;

  @override
  State<WebVideoDetailsPage> createState() => _WebVideoDetailsPageState();
}

class _WebVideoDetailsPageState extends State<WebVideoDetailsPage> {
  ///when like is null, no selection. dislike == false, like == true
  bool? like;
  bool? save;

  late String username;
  late int userId;

  TextEditingController commentTextFieldController = TextEditingController();

  loadUserInfo() {
    final pref = getIt<Storage>();
    username = pref.getUsername();
    userId = pref.getId();
  }

  @override
  void initState() {
    loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BehaviorSubject<int> likeSubject = BehaviorSubject<int>.seeded(0);
    final savedId = getIt<Storage>().getSavedVideos().firstWhere(
          (element) => element == widget.entity.id.toString(),
      orElse: () => '',
    );
    final BehaviorSubject<bool> saveSubject =
    BehaviorSubject<bool>.seeded(savedId != '');

    return BlocProvider(
      create: (context) =>
      getIt<VideoDetailsCubit>()
        ..getRelatedContent(widget.entity),
      child: BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () =>
            const Center(
              child: ACLoading(),
            ),
            done: () =>
                Scaffold(
                  appBar: AppBar(
                    title: Text(widget.entity.title ?? ''),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              ///left column
                              Flexible(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.6,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(AppSize.s12),
                                      ),
                                      child:
                                      VideoPlayerWidget(entity: widget.entity),
                                    ),
                                    AppSize.s12.heightSizeBox(),
                                    actionButtonsWidget(context),
                                    AppSize.s12.heightSizeBox(),
                                    commentsWidget(context)
                                  ],
                                ),
                              ),
                              AppSize.s8.widthSizeBox(),

                              ///right column
                              Flexible(
                                flex: 2,
                                child: Column(
                                  children: [
                                    contentInfoWidget(),
                                    if (widget.entity.attachments != null &&
                                        (widget.entity.attachments
                                            ?.isNotEmpty ??
                                            false))...[
                                      AppSize.s12.heightSizeBox(),
                                      attachmentsWidget(context),
                                    ],
                                    if (widget.entity.relatedContent != null &&
                                        (widget.entity.relatedContent
                                            ?.isNotEmpty ??
                                            false))
                                      ...[
                                      AppSize.s12.heightSizeBox(),
                                      relatedContents(context),
                                    ],
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: AppSize.s1,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onSurface,
                          ),
                          AppSize.s8.heightSizeBox(),
                        ],
                      ),
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }

  relatedContents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations
              .of(context)
              .relatedContents,
          style: Theme
              .of(context)
              .textTheme
              .titleSmall,
          textAlign: TextAlign.start,
        ),
        AppSize.s8.heightSizeBox(),
        Column(
          children: context
              .read<VideoDetailsCubit>()
              .relatedContent
              .map(
                (e) =>
                Column(
                  children: [
                    RelatedVideoContainer(
                      videoModel: e,
                      margin: 8,
                    ),
                    AppSize.s8.heightSizeBox(),
                  ],
                ),
          )
              .toList(),
        )
      ],
    );
  }

  commentsWidget(BuildContext context) {
    List<Widget> list = [];
    for (Comment comment in widget.entity.comments ?? []) {
      list.add(commentItemBuilder(context, comment));
    }

    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      // width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        color: Theme
            .of(context)
            .colorScheme
            .surfaceContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations
                .of(context)
                .comments,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          AppSize.s12.heightSizeBox(),
          TextFormField(
            controller: commentTextFieldController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  borderSide: BorderSide(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSurface,
                  ),
                ),
                hintText: AppLocalizations
                    .of(context)
                    .addComment),
          ),
          AppSize.s16.heightSizeBox(),
          Align(
            alignment: AppConstants.isFa
                ? Alignment.bottomLeft
                : Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                addComment(
                    contentId: widget.entity.id!,
                    text: commentTextFieldController.text,
                    userId: userId);
              },
              child: Text(AppLocalizations
                  .of(context)
                  .submit),
            ),
          ),
          Column(
            children: list.reversed.toList(),
          )
        ],
      ),
    );
  }

  actionButtonsWidget(context) {
    final likesCount = widget.entity.likesCount;
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
              padding: const EdgeInsets.all(AppPadding.p6),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .surfaceContainer,
                borderRadius: BorderRadius.circular(AppSize.s60),
              ),
              child: InkWell(
                onTap: () {
                  if (like != true) {
                    getIt<VideoDetailsCubit>()
                        .like(true, widget.entity.id ?? 0);
                  }
                  like = true;
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      like == true
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined,
                      color: like == true
                          ? Theme
                          .of(context)
                          .colorScheme
                          .primary
                          : Theme
                          .of(context)
                          .colorScheme
                          .onSurface,
                    ),
                    AppSize.s8.widthSizeBox(),
                    Text(
                      '${likesCount == null ? 0 : like == true
                          ? likesCount + 1
                          : like == false
                          ? likesCount == 0 ? 0 : likesCount - 1
                          : likesCount} likes',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
              padding: const EdgeInsets.all(AppPadding.p6),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .surfaceContainer,
                borderRadius: BorderRadius.circular(AppSize.s60),
              ),
              child: InkWell(
                onTap: () {
                  if (like != false) {
                    getIt<VideoDetailsCubit>()
                        .like(false, widget.entity.id ?? 0);
                  }
                  like = false;
                  setState(() {});
                },
                child: Icon(
                  like == false
                      ? Icons.thumb_down_alt
                      : Icons.thumb_down_alt_outlined,
                  color: like == false
                      ? Theme
                      .of(context)
                      .colorScheme
                      .primary
                      : Theme
                      .of(context)
                      .colorScheme
                      .onSurface,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
              padding: const EdgeInsets.all(AppPadding.p6),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .surfaceContainer,
                borderRadius: BorderRadius.circular(AppSize.s60),
              ),
              child: InkWell(
                onTap: () {
                  Share.share(
                      'check out my website http://academy.behpardaz.net',
                      subject: 'Look what We made!');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.share),
                    (AppSize.s4).widthSizeBox(),
                    Text(AppLocalizations
                        .of(context)
                        .share)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                padding: const EdgeInsets.all(AppPadding.p6),
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .surfaceContainer,
                  borderRadius: BorderRadius.circular(AppSize.s60),
                ),
                child: InkWell(
                  onTap: () {
                    save = !(save ?? false);
                    // context
                    //     .read<VideoDetailsCubit>()
                    //     .saveVideo(widget.entity.id);
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        save ?? false ? Icons.bookmark : Icons.bookmark_border,
                        color: save ?? false
                            ? Theme
                            .of(context)
                            .colorScheme
                            .primary
                            : Theme
                            .of(context)
                            .colorScheme
                            .onSurface,
                      ),
                      (AppSize.s4).widthSizeBox(),
                      Text(
                        AppLocalizations
                            .of(context)
                            .save,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                            color: save ?? false
                                ? Theme
                                .of(context)
                                .colorScheme
                                .primary
                                : Theme
                                .of(context)
                                .colorScheme
                                .onSurface),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  contentInfoWidget() {
    String categories = '';
    for (Category item in widget.entity.categories ?? []) {
      categories = '$categories ${item.name}';
    }
    final tags = widget.entity.tags?.join(', ') ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Content Info',
          style: Theme
              .of(context)
              .textTheme
              .titleSmall,
          textAlign: TextAlign.start,
        ),
        // AppSize.s8.heightSizeBox(),
        Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          width: double.infinity,
          // height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12),
            color: Theme
                .of(context)
                .colorScheme
                .surfaceContainer,
          ),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            rowOfData('Title: ', widget.entity.title ?? '-'),
            AppSize.s4.heightSizeBox(),
            rowOfData('Description: ', widget.entity.description ?? '-'),
            AppSize.s4.heightSizeBox(),
            rowOfData('Created By: ', widget.entity.authorName ?? '-'),
            AppSize.s4.heightSizeBox(),
            rowOfData(
                'Created At: ',
                DateFormat.timeAgo(
                  widget.entity.createdAt ??
                      DateTime.now().subtract(
                        const Duration(days: 5),
                      ),
                ) ??
                    '-'),
            AppSize.s4.heightSizeBox(),
            rowOfData('Views: ', widget.entity.viewCount.toString()),
            AppSize.s4.heightSizeBox(),
            rowOfData('Categories: ', categories ?? '-'),
            AppSize.s4.heightSizeBox(),
            rowOfData('Tags: ', tags ?? '-'),
            AppSize.s4.heightSizeBox(),
          ]),
        ),
      ],
    );
  }

  Widget rowOfData(String title, String? description) {
    return Row(
      children: [
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .titleSmall,
          textAlign: TextAlign.start,
        ),
        Flexible(
          child: Text(
            description ?? '-',
            style: Theme
                .of(context)
                .textTheme
                .titleSmall,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  attachmentsWidget(context) {
    List<Widget> list = [];
    for (Attachment attachment in widget.entity.attachments ?? []) {
      list.add(attachmentItemBuilder(context, attachment));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachments',
          style: Theme
              .of(context)
              .textTheme
              .titleSmall,
          textAlign: TextAlign.start,
        ),
        // AppSize.s8.heightSizeBox(),

        Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          width: double.infinity,
          // height: 150,
          child: (widget.entity.attachments ?? []).isNotEmpty
              ? Row(
            children: list,
          )
              : const SizedBox(
            child: Text('-'),
          ),
        ),
      ],
    );
  }

  attachmentItemBuilder(BuildContext context, Attachment attachment) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        color: Theme
            .of(context)
            .colorScheme
            .surfaceContainer,
      ),
      child: InkWell(
        onTap: () {
          UrlLauncher.launchUrl(Uri.parse(
              '${AppConstants.baseUrlWithoutPort}${attachment.filePath}'));
        },
        child: Column(
          children: [
            Image.asset(
              attachment.fileType == '.docx'
                  ? 'assets/word.png'
                  : attachment.fileType == '.pptx'
                  ? 'assets/powerpoint.png'
                  : attachment.fileType == '.pdf'
                  ? 'assets/pdf.png'
                  : 'assets/video.png',
              width: 40,
              height: 60,
            ),
            (AppSize.s4).heightSizeBox(),
            Text(attachment.fileType ?? '-')
          ],
        ),
      ),
    );
  }

  commentItemBuilder(BuildContext context, Comment comment) {
    return Column(
      children: [
        AppSize.s16.heightSizeBox(),
        Row(
          children: [
            Container(
              width: AppSize.s28,
              height: AppSize.s28,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSecondary),
              child: const Center(child: Icon(Icons.person)),
            ),
            AppSize.s4.widthSizeBox(),
            Text(
              '@$username',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
            const Spacer(),
            Text(
              DateFormat.timeAgo(
                comment.createdAt ??
                    DateTime.now().subtract(
                      const Duration(days: 5),
                    ),
              ),
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            )
          ],
        ),
        AppSize.s8.heightSizeBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: Row(
            children: [
              Text(
                comment.text ?? '-',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.reply,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .secondary,
                    size: AppSize.s28,
                  )),
            ],
          ),
        )
      ],
    );
  }

  Future<void> addComment({required int contentId,
    required int userId,
    required String text}) async {
    final url = '${AppConstants.baseUrl}/contents/$contentId/comments';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'content_id': contentId,
      'user_id': userId,
      'text': text,
    });

    try {
      final response =
      await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 201) {
        print('Comment added successfully');
        getComments(contentId: contentId);
        // Optionally, handle success (e.g., update UI, notify user, etc.)
      } else {
        print('Failed to add comment: ${response.statusCode}');
        // Optionally, handle the error (e.g., show a message to the user)
      }
    } catch (e) {
      print('Error adding comment: $e');
      // Optionally, handle network or other errors
    }
  }

  getComments({required int contentId}) async {
    final url = '${AppConstants.baseUrl}/contents/$contentId/comments';
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        print('Comment added successfully');
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<Comment> newComments =
        responseData.map((data) => Comment.fromJson(data)).toList();

        widget.entity.comments = newComments;

        setState(() {});
        // Optionally, handle success (e.g., update UI, notify user, etc.)
      } else {
        print('Failed to add comment: ${response.statusCode}');
        // Optionally, handle the error (e.g., show a message to the user)
      }
    } catch (e) {
      print('Error adding comment: $e');
      // Optionally, handle network or other errors
    }
  }
}
