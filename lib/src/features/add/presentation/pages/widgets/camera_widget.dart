import 'dart:io';

import 'package:academy/src/core/resources/resources.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {

  CameraController? _controller;
  XFile? _imageFile;
  XFile? _videoFile;
  bool _isRecording = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeCamera(widget.cameras[0]);
  }

  Future<void> _initializeCamera(CameraDescription cameraDescription) async {
    _controller = CameraController(cameraDescription, ResolutionPreset.high);
    await _controller?.initialize();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
      _videoFile = null;
    });
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized && !_controller!.value.isRecordingVideo) {
      final image = await _controller!.takePicture();
      setState(() {
        _imageFile = image;
        _videoFile = null;
      });
    }
  }

  Future<void> _recordVideo() async {
    if (_controller != null && _controller!.value.isInitialized && !_isRecording) {
      final video = await _controller!.startVideoRecording();
      setState(() {
        // _videoFile = video;
        _isRecording = true;
      });
    }
  }

  Future<void> _stopRecordingVideo() async {
    if (_controller != null && _controller!.value.isInitialized && _isRecording) {
      final video = await _controller!.stopVideoRecording();
      setState(() {
        _videoFile = video;
        _isRecording = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller!),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo_library, color: Colors.white, size: AppSize.s28,),
                    onPressed: _pickImageFromGallery,
                  ),
                  IconButton(
                    icon: Icon(_isRecording ? Icons.videocam_off : Icons.videocam, color: Colors.white, size: AppSize.s28,),
                    onPressed: _isRecording ? _stopRecordingVideo : _recordVideo,
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white, size: AppSize.s28,),
                    onPressed: _takePicture,
                  ),
                ],
              ),
            ),
          ),
          // if (_imageFile != null) ...[
          //   const Text('Captured Image:'),
          //   Image.file(File(_imageFile!.path)),
          // ] else if (_videoFile != null) ...[
          //   const Text('Recorded Video:'),
          //   Text(_videoFile!.path),
          // ],
        ],
      ),
    );
  }
}
