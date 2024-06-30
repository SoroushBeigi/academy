

import 'package:academy/src/features/new_content/new_content.dart';
import '../../../../saved/domain/entity/content/response/content_response_entity.dart';

class NewContentWidgetPhone extends StatefulWidget {
  const NewContentWidgetPhone({super.key});

  @override
  State<NewContentWidgetPhone> createState() => _NewContentWidgetPhoneState();
}

class _NewContentWidgetPhoneState extends State<NewContentWidgetPhone> {
  String? selectedCategoryKey;

  String? selectedApprovedContentKey;

  List<CategoryResponseEntity> selectedCategoryList = [];

  List<ContentResponseEntity> approvedContentsList = [];

  void deleteCategory(String name) {
    setState(() {
      selectedCategoryList.removeWhere((item) => item.name == name);
    });
  }

  void deleteRelated(String title) {
    setState(() {
      approvedContentsList.removeWhere((item) => item.title == title);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context);
    return BlocBuilder<NewContentCubit, NewContentState>(
      builder: (BuildContext context, NewContentState state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: context.read<NewContentCubit>().formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ACTextFormField(
                        controller: context.read<NewContentCubit>().videoTitle,
                        borderColor: Theme.of(context).colorScheme.secondaryContainer,
                        hintText: textLocalization.title,
                        style: Theme.of(context).textTheme.titleMedium,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is required';
                          }
                          return null;
                        }),
                    Space.h16,
                    ACTextFormField(
                        controller: context
                            .read<NewContentCubit>()
                            .videoDescription,
                        borderColor: Theme.of(context)
                            .colorScheme
                            .secondaryContainer,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 5,
                        hintText: textLocalization.description,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is required';
                          }
                          return null;
                        }),
                    Space.h16,
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: AppSize.s2,
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryContainer,
                        ),
                        borderRadius:
                        BorderRadius.circular(AppSize.s12),
                      ),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Text('${textLocalization.categories}:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium),
                          Space.w12,
                          Expanded(
                            child: CategoryWidget(
                              onTagListChanged: (Map<String, int>
                              updatedCategoryMap) {
                                setState(() {
                                  context
                                      .read<NewContentCubit>()
                                      .categoryMap =
                                      updatedCategoryMap;
                                });
                                context
                                    .read<NewContentCubit>()
                                    .categoryIds
                                    .clear();
                                (context
                                    .read<NewContentCubit>()
                                    .categoryMap)
                                    .entries
                                    .map((entry) => context
                                    .read<NewContentCubit>()
                                    .categoryIds
                                    .add(entry.value))
                                    .toList();
                              },
                              categoryMap: context
                                  .read<NewContentCubit>()
                                  .categoryMap,
                              allCategoryMap: context
                                  .read<NewContentCubit>()
                                  .allCategoryMap,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Space.h16,
                    Row(
                      children: [
                        Expanded(
                          child: _buildFilePicker(
                            label: textLocalization.selectMainFile,
                            hint: textLocalization.acceptedFormates,
                            onTap: _pickMainFile,
                            fileResult:
                            context.read<NewContentCubit>().mainFileResult,
                          ),
                        ),
                        Space.w12,
                        Expanded(
                          child: _buildFilePicker(
                            label: textLocalization.addPhoto,
                            hint: textLocalization.acceptedFormatesImage,
                            onTap: _pickImageFile,
                            fileResult:
                            context.read<NewContentCubit>().imageFileResult,
                          ),
                        ),
                      ],
                    ),
                    Space.h16,
                    _buildTagsInput(),
                    Space.h16,
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: AppSize.s2,
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(AppSize.s12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${textLocalization.relatedContent}:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium),
                          Space.w12,
                          Expanded(
                            child: CategoryWidget(
                              onTagListChanged:
                                  (Map<String, int> updatedCategoryMap) {
                                setState(() {
                                  context
                                      .read<NewContentCubit>()
                                      .contentsMap = updatedCategoryMap;
                                });
                                context
                                    .read<NewContentCubit>()
                                    .relatedIds
                                    .clear();
                                (context
                                    .read<NewContentCubit>()
                                    .contentsMap)
                                    .entries
                                    .map((entry) => context
                                    .read<NewContentCubit>()
                                    .relatedIds
                                    .add(entry.value))
                                    .toList();
                              },
                              categoryMap: context
                                  .read<NewContentCubit>()
                                  .contentsMap,
                              allCategoryMap: context
                                  .read<NewContentCubit>()
                                  .allContentsMap,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Space.h16,
                    _buildAttachmentPicker(),
                    Space.h16,
                    BlocBuilder<NewContentCubit, NewContentState>(
                      builder: (BuildContext context, NewContentState state) {
                        return state.maybeWhen(
                            loadingAddNewContent: (progress) {
                              return ACElevatedButton(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                onTap: () {},
                                child: Column(
                                  children: [
                                    CircularProgressIndicator(
                                      value: progress / 100,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                    Space.h8,
                                    Text(
                                      '$progress% Completed',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                    ),
                                  ],
                                ),
                              );
                            },
                            orElse: () => ACElevatedButton(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                              onTap: _submitForm,
                              title: textLocalization.createNewContent,
                            )
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilePicker(
      {required String label,
        required String hint,
        required VoidCallback onTap,
        VoidCallback? deleteOnTap,
        bool? isAttachment,
        FilePickerResult? fileResult}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16, horizontal: AppPadding.p12),
        decoration: BoxDecoration(
          border: Border.all(
              width: AppSize.s2,
              color: Theme.of(context).colorScheme.secondaryContainer),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: (isAttachment ?? false)
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.file_upload,
                    size: AppSize.s42,
                    color: Theme.of(context).colorScheme.tertiary),
                Space.h8,
                Text(label,
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center),
                Space.h8,
                if (fileResult != null)
                  Text(fileResult.files.single.name,
                      textAlign: TextAlign.center),
                Text(hint,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                    textAlign: TextAlign.center),
              ],
            ),
            if (isAttachment ?? false)
              Positioned(
                right: AppSize.s12,
                child: InkWell(
                  onTap: deleteOnTap,
                  child: Icon(
                    IconManager.close,
                    size: AppSize.s24,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentPicker() {
    final textLocalization = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSize.s2,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p6),
            child: Row(
              children: [
                Text('${textLocalization.selectAttachment}:',
                    style: Theme.of(context).textTheme.titleMedium),
                Space.w12,
                Expanded(
                  child: Wrap(
                    spacing: AppSize.s8,
                    runSpacing: AppSize.s8,
                    children: (context
                        .read<NewContentCubit>()
                        .attachmentResults
                        .asMap()
                        .entries)
                        .map((entry) {
                      int index = entry.key;
                      var item = entry.value;
                      return _buildFilePicker(
                        deleteOnTap: () => _removeAttachment(index),
                        isAttachment: true,
                        label: '${textLocalization.attachments} ${index + 1}',
                        hint: textLocalization.acceptedFormatesAttachment,
                        onTap: () => _pickAttachment(index),
                        fileResult: item,
                      );
                    }).toList()
                      ..add(
                        Container(
                          padding: const EdgeInsets.all(AppPadding.p6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: AppSize.s2,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            borderRadius: BorderRadius.circular(AppSize.s12),
                          ),
                          child: InkWell(
                            onTap: _addAttachment,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(textLocalization.add,
                                    style:
                                    Theme.of(context).textTheme.bodyMedium),
                                Space.w4,
                                Icon(IconManager.add,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsInput() {
    final textLocalization = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppPadding.p6),
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSize.s2,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Row(
        children: [
          Text(
            '${textLocalization.tags}:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Space.w12,
          TagWidget(
            tags: context.read<NewContentCubit>().tags,
            onTagListChanged: (List<String> updatedTags) {
              setState(() {
                context.read<NewContentCubit>().tags = updatedTags;
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickMainFile() async {
    print('Picking main file...');
    context
        .read<NewContentCubit>()
        .mainFileResult = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['mp4']);
    print(
        'Main file picked: ${context
            .read<NewContentCubit>()
            .mainFileResult
            ?.files
            .single
            .name}');
    setState(() {});
  }

  Future<void> _pickImageFile() async {
    print('Picking image file...');
    context
        .read<NewContentCubit>()
        .imageFileResult =
    await FilePicker.platform.pickFiles(type: FileType.image);
    print(
        'Image file picked: ${context
            .read<NewContentCubit>()
            .imageFileResult
            ?.files
            .single
            .name}');
    setState(() {});
  }

  Future<void> _pickAttachment(int index) async {
    print('Picking attachment for index $index...');
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        if (index >= context
            .read<NewContentCubit>()
            .attachmentResults
            .length) {
          context
              .read<NewContentCubit>()
              .attachmentResults
              .add(result);
        } else {
          context
              .read<NewContentCubit>()
              .attachmentResults[index] = result;
        }
        print('Attachment picked: ${result.files.single.name}');
      });
    } else {
      print('No attachment picked');
    }
  }

  void _addAttachment() {
    print('Adding attachment...');
    setState(() {
      context
          .read<NewContentCubit>()
          .attachmentResults
          .add(null);
    });
  }

  void _removeAttachment(int index) {
    print('Removing attachment at index $index...');
    setState(() {
      context
          .read<NewContentCubit>()
          .attachmentResults
          .removeAt(index);
    });
  }

  void _submitForm() {
    print('Submitting form...');
    if (context
        .read<NewContentCubit>()
        .formKey
        .currentState
        ?.validate() ??
        false) {
      context
          .read<NewContentCubit>()
          .formKey
          .currentState
          ?.save();
      for (var i in selectedCategoryList) {
        context
            .read<NewContentCubit>()
            .categoryIds
            .add(i.id ?? 1);
      }
      for (var i in approvedContentsList) {
        context
            .read<NewContentCubit>()
            .relatedIds
            .add(i.id ?? 1);
        print(i.id);
      }
      print(context
          .read<NewContentCubit>()
          .categoryIds);
      context.read<NewContentCubit>().createContent(onProgress: (progress) {
        print('Upload Progress: $progress%');
      });
    } else {
      print('Form validation failed');
    }
  }
}
