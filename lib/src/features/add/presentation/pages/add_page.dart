// import 'package:academy/src/core/extensions/extensions.dart';
// import 'package:academy/src/core/resources/resources.dart';
// import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
// import 'package:academy/src/di/di_setup.dart';
// import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class AddPage extends StatelessWidget {
//   const AddPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//   create: (context) {
//     var bloc = getIt<AddCubit>();
//     return bloc;
//   },
//   child: Scaffold(
//       body: ResponsiveWidget(
//         smallScreen: smallScreen(context ),
//         mediumScreen: largeScreen(context),
//         largeScreen: largeScreen(context),
//       ),
//     ),
// );
//   }
//
//   smallScreen(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => context.push('/add/addVideo'),
//                     child: Container(
//                       margin: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           borderRadius:
//                           const BorderRadius.only(topLeft: Radius.circular(30)),
//                           color: colorScheme.primary),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.video_camera_back_rounded,
//                             color: colorScheme.onPrimary,
//                             size: 80,
//                           ),
//                           AppSize.s16.heightSizeBox(),
//                           Text(
//                             AppLocalizations.of(context).addVideo,
//                             textAlign: TextAlign.center,
//                             style: styleHandler(true, context),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => getIt<AddCubit>().openFilePicker(),
//                     child: Container(
//                       margin: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                               topRight: Radius.circular(30)),
//                           color: colorScheme.primary),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.draw,
//                             color: colorScheme.onPrimary,
//                             size: 80,
//                           ),
//                           AppSize.s16.heightSizeBox(),
//                           Text(
//                             AppLocalizations.of(context).addWord,
//                             textAlign: TextAlign.center,
//                             style: styleHandler(true, context),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => getIt<AddCubit>().openFilePicker(),
//                     child: Container(
//                       margin: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                               bottomLeft: Radius.circular(30)),
//                           color: colorScheme.primary),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.book,
//                             color: colorScheme.onPrimary,
//                             size: 80,
//                           ),
//                           AppSize.s16.heightSizeBox(),
//                           Text(
//                             AppLocalizations.of(context).addPdf,
//                             textAlign: TextAlign.center,
//                             style: styleHandler(true, context),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => getIt<AddCubit>().openFilePicker(),
//                     child: Container(
//                       margin: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                               bottomRight: Radius.circular(30)),
//                           color: colorScheme.primary),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.slideshow,
//                             color: colorScheme.onPrimary,
//                             size: 80,
//                           ),
//                           AppSize.s16.heightSizeBox(),
//                           Text(AppLocalizations.of(context).addSlide,
//                               textAlign: TextAlign.center,
//                               style: styleHandler(true, context)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           AppSize.s80.heightSizeBox()
//         ],
//       ),
//     );
//   }
//
//   largeScreen(context,) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () => getIt<AddCubit>().openFilePicker(),
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     height: height / 4,
//                     width: width / 4,
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.only(topLeft: Radius.circular(30)),
//                         color: colorScheme.primary),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.video_camera_back_rounded,
//                           color: colorScheme.onPrimary,
//                           size: 80,
//                         ),
//                         AppSize.s16.heightSizeBox(),
//                         Text(
//                           AppLocalizations.of(context).addVideo,
//                           style: styleHandler(false, context),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => getIt<AddCubit>().openFilePicker(),
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     height: height / 4,
//                     width: width / 4,
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(30)),
//                         color: colorScheme.primary),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.draw,
//                           color: colorScheme.onPrimary,
//                           size: 80,
//                         ),
//                         AppSize.s16.heightSizeBox(),
//                         Text(
//                           AppLocalizations.of(context).addWord,
//                           style: styleHandler(false, context),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () => getIt<AddCubit>().openFilePicker(),
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     height: height / 4,
//                     width: width / 4,
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(30)),
//                         color: colorScheme.primary),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.book,
//                           color: colorScheme.onPrimary,
//                           size: 80,
//                         ),
//                         AppSize.s16.heightSizeBox(),
//                         Text(
//                           AppLocalizations.of(context).addPdf,
//                           style: styleHandler(false, context),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => getIt<AddCubit>().openFilePicker(),
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     height: height / 4,
//                     width: width / 4,
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                             bottomRight: Radius.circular(30)),
//                         color: colorScheme.primary),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.slideshow,
//                           color: colorScheme.onPrimary,
//                           size: 80,
//                         ),
//                         AppSize.s16.heightSizeBox(),
//                         Text(AppLocalizations.of(context).addSlide,
//                             style: styleHandler(false, context)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   TextStyle styleHandler(bool isPhone, context) {
//     if (isPhone) {
//       return Theme.of(context).textTheme.titleMedium!.copyWith(
//           color: Theme.of(context).colorScheme.onPrimary,
//           fontWeight: FontWeight.w600);
//     } else {
//       return Theme.of(context).textTheme.titleLarge!.copyWith(
//           color: Theme.of(context).colorScheme.onPrimary,
//           fontWeight: FontWeight.w600);
//     }
//   }
// }


import 'package:academy/src/features/main/presentation/bloc/main_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:http_parser/http_parser.dart';


class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final videoTitle = TextEditingController();
  final videoDescription = TextEditingController();
  final _authorNameController = TextEditingController();
  int _authorId = 1;
  List<String> _tags = [];
  List<int> _categoryIds = [];
  FilePickerResult? _mainFileResult;
  FilePickerResult? _imageFileResult;
  List<FilePickerResult?> _attachmentResults = [];


  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildTextField(videoTitle, 'Title', 'Enter title'),
                  SizedBox(height: 8.0),
                  _buildTextField(videoDescription, 'Description', 'Enter description', maxLines: 6),
                  SizedBox(height: 8.0),
                  _buildTextField(_authorNameController, 'Author Name', 'Enter author name'),
                  SizedBox(height: 16.0),
                  _buildFilePicker(
                    label: 'Select Main File',
                    hint: 'Accepted formats: mp4',
                    onTap: _pickMainFile,
                    fileResult: _mainFileResult,
                  ),
                  SizedBox(height: 16.0),
                  _buildFilePicker(
                    label: 'Add Image',
                    hint: 'Accepted formats: jpg, png',
                    onTap: _pickImageFile,
                    fileResult: _imageFileResult,
                  ),
                  SizedBox(height: 16.0),
                  _buildAttachmentPicker(),
                  SizedBox(height: 16.0),
                  _buildTagsInput(),
                  SizedBox(height: 16.0),
                  _buildCategorySelector(),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: loading ? CircularProgressIndicator() : Text('Create Content'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label, hintText: hint),
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }

  Widget _buildFilePicker({required String label, required String hint, required VoidCallback onTap, FilePickerResult? fileResult}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Theme.of(context).colorScheme.onSecondary),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.file_upload, size: 42, color: Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 8.0),
            Text(label, style: Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
            SizedBox(height: 8.0),
            if (fileResult != null)
              Text(fileResult.files.single.name, textAlign: TextAlign.center),
            Text(hint, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentPicker() {
    return Column(
      children: [
        Text('Attachments', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8.0),
        for (int i = 0; i < _attachmentResults.length; i++)
          Stack(
            alignment: Alignment.topRight,
            children: [
              _buildFilePicker(
                label: 'Attachment ${i + 1}',
                hint: 'Accepted formats: docx, pdf, pptx',
                onTap: () => _pickAttachment(i),
                fileResult: _attachmentResults[i],
              ),
              IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () => _removeAttachment(i),
              ),
            ],
          ),
        TextButton(
          onPressed: _addAttachment,
          child: Text('Add Attachment'),
        ),
      ],
    );
  }

  Widget _buildTagsInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tags', hintText: 'Enter tags separated by commas'),
      onChanged: (value) {
        setState(() {
          _tags = value.split(',').map((tag) => tag.trim()).toList();
        });
      },
      validator: (value) {
        if (_tags.isEmpty) {
          return 'Please enter at least one tag';
        }
        return null;
      },
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: Theme.of(context).textTheme.titleMedium),
        DropdownButtonFormField<int>(
          value: _categoryIds.isEmpty ? null : _categoryIds.first,
          hint: Text('Select Categories'),
          onChanged: (value) {
            setState(() {
              _categoryIds = [value!];
            });
          },
          items: List.generate(10, (index) => DropdownMenuItem<int>(
            value: index + 1,
            child: Text('Category ${index + 1}'),
          )),
          validator: (value) => value == null ? 'Please select a category' : null,
        ),
      ],
    );
  }

  Future<void> _pickMainFile() async {
    print('Picking main file...');
    _mainFileResult = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['mp4']);
    print('Main file picked: ${_mainFileResult?.files.single.name}');
    setState(() {});
  }

  Future<void> _pickImageFile() async {
    print('Picking image file...');
    _imageFileResult = await FilePicker.platform.pickFiles(type: FileType.image);
    print('Image file picked: ${_imageFileResult?.files.single.name}');
    setState(() {});
  }

  Future<void> _pickAttachment(int index) async {
    print('Picking attachment for index $index...');
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        if (index >= _attachmentResults.length) {
          _attachmentResults.add(result);
        } else {
          _attachmentResults[index] = result;
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
      _attachmentResults.add(null);
    });
  }

  void _removeAttachment(int index) {
    print('Removing attachment at index $index...');
    setState(() {
      _attachmentResults.removeAt(index);
    });
  }

  void _submitForm() {
    print('Submitting form...');
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _createContent(context);
    } else {
      print('Form validation failed');
    }
  }

  void _createContent(BuildContext context) async {
    setState(() {
      loading = true;
    });
    print('Creating content...');

    final request = http.MultipartRequest('POST', Uri.parse('http://172.16.251.80:8080/content/upload_new'));
    request.fields['title'] = videoTitle.text;
    request.fields['description'] = videoDescription.text;
    request.fields['author_id'] = _authorId.toString();
    request.fields['author_name'] = _authorNameController.text;
    request.fields['tags'] = jsonEncode(_tags);
    request.fields['category_ids'] = _categoryIds.join(',');

    if (_mainFileResult != null) {
      final mainFile = _mainFileResult!.files.single;
      request.files.add(http.MultipartFile.fromBytes(
        'main_file',
        mainFile.bytes!,
        filename: mainFile.name,
        contentType: MediaType('application', 'octet-stream'),
      ));
    }

    if (_imageFileResult != null) {
      final imageFile = _imageFileResult!.files.single;
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        imageFile.bytes!,
        filename: imageFile.name,
        contentType: MediaType('application', 'octet-stream'),
      ));
    }

    for (int i = 0; i < _attachmentResults.length; i++) {
      if (_attachmentResults[i] != null) {
        final attachmentFile = _attachmentResults[i]!.files.single;
        request.files.add(http.MultipartFile.fromBytes(
          'attachment_${i + 1}',
          attachmentFile.bytes!,
          filename: attachmentFile.name,
          contentType: MediaType('application', 'octet-stream'),
        ));
      }
    }

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Content created successfully');
        setState(() {
          loading = false;
        });
        context.go('/main', extra: true);
        context
            .read<MainCubit>()
            .updateNavigationIndexState(0);
      } else {
        print('Failed to create content: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error sending request: $e');
    }
  }
}
