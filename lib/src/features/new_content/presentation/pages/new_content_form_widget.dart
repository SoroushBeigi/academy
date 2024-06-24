import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/features/new_content/domain/entity/category/response/category_response_entity.dart';
import 'package:academy/src/features/new_content/domain/entity/content_list/response/content_response_entity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/resources.dart';
import '../../../core/core.dart';
import '../../../core/ui_kits/ac_elevated_button/ac_elevated_button.dart';
import '../../../core/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import '../bloc/new_content_cubit.dart';
import '../bloc/new_content_state.dart';

class NewContentFormWidget extends StatefulWidget {
  const NewContentFormWidget({super.key});

  @override
  State<NewContentFormWidget> createState() => _NewContentFormWidgetState();
}

class _NewContentFormWidgetState extends State<NewContentFormWidget> {
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
        return state.whenOrNull(
            loading: () => const ACLoading()
        ) ?? Form(
          key: context
              .read<NewContentCubit>()
              .formKey,
          child: ResponsiveWidget(
            largeScreen: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ACTextFormField(
                          style: Theme.of(context).textTheme.headlineMedium,
                            controller: context
                                .read<NewContentCubit>()
                                .videoTitle,
                            hintText: textLocalization.title,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Title is required';
                              }
                              return null;
                            }),
                      ),
                      Space.w8,
                      Expanded(
                        child: ACTextFormField(
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge,
                            controller:
                            context
                                .read<NewContentCubit>()
                                .videoDescription,
                            hintText: textLocalization.description,
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Title is required';
                              }
                              return null;
                            }),
                      ),
                    ],
                  ),
                  Space.h16,
                  Row(
                    children: [
                      Expanded(
                        child: _buildFilePicker(
                          label: textLocalization.selectMainFile,
                          hint: textLocalization.acceptedFormates,
                          onTap: _pickMainFile,
                          fileResult: context
                              .read<NewContentCubit>()
                              .mainFileResult,
                        ),
                      ),
                      Space.w12,
                      Expanded(
                        child: _buildFilePicker(
                          label: textLocalization.addPhoto,
                          hint: textLocalization.acceptedFormatesImage,
                          onTap: _pickImageFile,
                          fileResult: context
                              .read<NewContentCubit>()
                              .imageFileResult,
                        ),
                      ),
                    ],
                  ),
                  Space.h16,
                  Row(
                    children: [
                      Expanded(child: _buildAttachmentPicker()),
                      Space.w12,
                      Expanded(child: _buildTagsInput()),
                    ],
                  ),
                  Space.h16,
                  Row(
                    children: [
                      Expanded(child: _buildCategories(context)),

                      Space.w16,
                      Expanded(
                          child: _buildRelatedContent(context)
                      ),
                    ],
                  ),
                  Space.h16,
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      textLocalization.createNewContent, style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,),
                  ),
                ],
              ),
            ),
            smallScreen: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  ACTextFormField(
                      style: Theme.of(context).textTheme.headlineMedium,
                      controller: context
                          .read<NewContentCubit>()
                          .videoTitle,
                      hintText: textLocalization.title,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      }),
                  Space.h8,
                  ACTextFormField(
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,
                      controller:
                      context
                          .read<NewContentCubit>()
                          .videoDescription,
                      hintText: textLocalization.description,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      }),

                Space.h8,
                _buildFilePicker(
                  label: textLocalization.selectMainFile,
                  hint: textLocalization.acceptedFormates,
                  onTap: _pickMainFile,
                  fileResult: context
                      .read<NewContentCubit>()
                      .mainFileResult,
                ),
                Space.h8,
                _buildFilePicker(
                  label: textLocalization.addPhoto,
                  hint: textLocalization.acceptedFormatesImage,
                  onTap: _pickImageFile,
                  fileResult: context
                      .read<NewContentCubit>()
                      .imageFileResult,
                ),
                Space.h16,
                _buildAttachmentPicker(),
                Space.h8,
               _buildTagsInput(),
                Space.h16,

                _buildCategories(context),
                Space.h16,

                _buildRelatedContent(context),

                Space.h16,
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    textLocalization.createNewContent, style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,),
                ),
              ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilePicker({required String label,
    required String hint,
    required VoidCallback onTap,
    FilePickerResult? fileResult}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2.0, color: Theme
              .of(context)
              .colorScheme
              .secondary),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.file_upload,
                size: 42, color: Theme
                    .of(context)
                    .colorScheme
                    .tertiary),
            SizedBox(height: 8.0),
            Text(label,
                style: Theme
                    .of(context)
                    .textTheme
                    .displaySmall,
                textAlign: TextAlign.center),
            SizedBox(height: 8.0),
            if (fileResult != null)
              Text(fileResult.files.single.name, textAlign: TextAlign.center),
            Text(hint,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme
                    .of(context)
                    .colorScheme
                    .secondary),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentPicker() {
    final textLocalization = AppLocalizations.of(context);
    return InkWell(
      onTap: _addAttachment,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
        decoration: BoxDecoration(
          border: Border.all(
              width: AppSize.s2,
              color: Theme
                  .of(context)
                  .colorScheme
                  .secondary),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Column(
          children: [
            Text(textLocalization.selectAttachment,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium),
            Space.h8,
            for (int i = 0;
            i < context
                .read<NewContentCubit>()
                .attachmentResults
                .length;
            i++)
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      children: [
                        _buildFilePicker(
                          label: '${textLocalization.attachments} ${i + 1}',
                          hint: textLocalization.acceptedFormatesAttachment,
                          onTap: () => _pickAttachment(i),
                          fileResult:
                          context
                              .read<NewContentCubit>()
                              .attachmentResults[i],
                        ),
                        Space.h8,
                        ACElevatedButton(
                          width: AppSize.s120,
                          onTap: _addAttachment,
                          child: Icon(Icons.add, color: Theme
                              .of(context)
                              .colorScheme
                              .surface,),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => _removeAttachment(i),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsInput() {
    final textLocalization = AppLocalizations.of(context);
    return TextFormField(
      decoration: InputDecoration(
          labelText: textLocalization.tags, hintText: textLocalization.tagHint),
      onChanged: (value) {
        setState(() {
          context
              .read<NewContentCubit>()
              .tags =
              value.split(',').map((tag) => tag.trim()).toList();
        });
      },
      validator: (value) {
        if (context
            .read<NewContentCubit>()
            .tags
            .isEmpty) {
          return textLocalization.tagValidator;
        }
        return null;
      },
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
      context.read<NewContentCubit>().createContent();
    } else {
      print('Form validation failed');
    }
  }

  _buildCategories(BuildContext context) {
    final textLocalization = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppPadding.p6),
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSize.s2,
          color: Theme
              .of(context)
              .colorScheme
              .secondary,
        ),
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${textLocalization.categories}:', style: Theme
              .of(context)
              .textTheme
              .titleMedium),
          Space.w12,
          if(selectedCategoryList.isNotEmpty)Expanded(
            child: Wrap(
              spacing: AppSize.s8,
              runSpacing: AppSize.s8,
              children: selectedCategoryList.map((item) {
                return Container(
                  padding: const EdgeInsets.all(AppPadding.p6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: AppSize.s2,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(item.name ?? '',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .bodyMedium),
                      Space.w4,
                      InkWell(
                        onTap: () {
                          deleteCategory(item.name ?? '');
                        },
                        child: Icon(IconManager.close,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .error),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Space.w12,
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return StatefulBuilder(
                    builder: (_, void Function(void Function()) updateState) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p16),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          textLocalization.selectAnItem,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        value: selectedCategoryKey,
                                        items: context
                                            .read<NewContentCubit>()
                                            .categoryMap
                                            .keys
                                            .map((String key) {
                                          return DropdownMenuItem<String>(
                                            value: key,
                                            child: Text(key),
                                          );
                                        }).toList(),
                                        onChanged: (String? newKey) {
                                          updateState(() {
                                            selectedCategoryKey = newKey;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Space.h16,
                                ACElevatedButton(
                                  width: AppSize.s120,
                                  onTap: () {
                                    setState(() {
                                      selectedCategoryList.add(
                                          CategoryResponseEntity(
                                              name: selectedCategoryKey,
                                              id: context
                                                  .read<NewContentCubit>()
                                                  .categoryMap[selectedCategoryKey]));
                                      context.pop();
                                    });
                                  },
                                  child: Text(textLocalization.add, style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  border: Border.all(
                      width: AppSize.s1,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary
                  )
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),

    );
  }

  _buildRelatedContent(BuildContext context) {
    final textLocalization = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppPadding.p6),
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSize.s2,
          color: Theme
              .of(context)
              .colorScheme
              .secondary,
        ),
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${textLocalization.relatedContent}:', style: Theme
              .of(context)
              .textTheme
              .titleMedium),
          Space.w12,
          if(approvedContentsList.isNotEmpty)Expanded(
            child: Wrap(
              spacing: AppSize.s8,
              runSpacing: AppSize.s8,
              children: approvedContentsList.map((item) {
                return Container(
                  padding: const EdgeInsets.all(AppPadding.p6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: AppSize.s2,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondaryContainer,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(item.title ?? '',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .bodyMedium),
                      Space.w4,
                      InkWell(
                        onTap: () {
                          deleteRelated(item.title ?? '');
                        },
                        child: Icon(IconManager.close,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .error),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Space.w12,
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return StatefulBuilder(
                    builder: (_, void Function(void Function()) updateState) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p16),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          textLocalization.selectAnItem,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        value: selectedApprovedContentKey,
                                        items: context
                                            .read<NewContentCubit>()
                                            .approvedContentsMap
                                            .keys
                                            .map((String key) {
                                          return DropdownMenuItem<String>(
                                            value: key,
                                            child: Text(key),
                                          );
                                        }).toList(),
                                        onChanged: (String? newKey) {
                                          updateState(() {
                                            selectedApprovedContentKey = newKey;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Space.h16,
                                ACElevatedButton(
                                  width: AppSize.s120,
                                  onTap: () {
                                    setState(() {
                                      approvedContentsList.add(
                                          ContentResponseEntity(
                                              title: selectedApprovedContentKey,
                                              id: context
                                                  .read<NewContentCubit>()
                                                  .approvedContentsMap[selectedApprovedContentKey]));
                                      context.pop();
                                    });
                                  },
                                  child: Text(textLocalization.add, style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  border: Border.all(
                      width: AppSize.s1,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary
                  )
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),

    );
  }
}
