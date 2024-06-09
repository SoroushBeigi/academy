import 'dart:io';

import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../di/di_setup.dart';
import '../../../../../core/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class UploadVideo extends StatefulWidget {
  static const uploadVideoPageName = '/upload-video-page';
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        var bloc = getIt<AddCubit>();
        return bloc;
      },
      child: BlocConsumer<AddCubit, AddState>(
        listener: (BuildContext context, state) {
          state.whenOrNull(
            success: () {
              context.go('/');
            }
          );
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: _pickImage,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: AppSize.s2,
                              color: Theme.of(context).colorScheme.surfaceContainer
                          ),
                        ),
                        child: _selectedImage == null ?  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.cloud_upload_outlined),
                            Text(AppLocalizations.of(context).uploadImage, style: Theme.of(context).textTheme.titleMedium,),
                            Text(AppLocalizations.of(context).acceptedFormats, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),),
                          ],
                        ) : Image.file(
                          _selectedImage!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    AppSize.s16.heightSizeBox(),
                    ACTextFormField(
                      controller: context.read<AddCubit>().titleController,
                      hintText: AppLocalizations.of(context).videoTitle,
                      borderColor: Theme.of(context).colorScheme.secondary,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    AppSize.s16.heightSizeBox(),
                    ACTextFormField(
                      borderColor: Theme.of(context).colorScheme.secondary,
                      controller: context.read<AddCubit>().descriptionController,
                      hintText: AppLocalizations.of(context).videoDescription,
                      maxLines: 5,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    AppSize.s16.heightSizeBox(),
                    BlocBuilder<AddCubit, AddState>(
                      builder: (BuildContext context, state) {
                        return state.whenOrNull(
                          loading: (progress) {
                            return ElevatedButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  CircularProgressIndicator(value: progress,),
                                  AppSize.s4.heightSizeBox(),
                                  Text('${(progress * 100).toStringAsFixed(0)}%'),
                                ],
                              ),
                            );
                          },

                        ) ?? ElevatedButton(
                          onPressed: () {
                            File? video = File(AddCubit.videoPath);
                            context.read<AddCubit>().uploadVideo(videoFile: video,selectedImage: _selectedImage);
                          },
                          child:  Text(
                              AppLocalizations.of(context).upload
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
