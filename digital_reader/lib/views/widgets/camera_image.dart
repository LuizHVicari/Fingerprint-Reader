import 'package:camera/camera.dart';
import 'package:digital_reader/views/styles/camera_image_container_style.dart';
import 'package:flutter/material.dart';

class DisplayCameraImage extends StatefulWidget {
  final CameraDescription camera;
  final Future<void> initializeControllerFuture;
  final CameraController controller;
  const DisplayCameraImage({super.key, required this.camera, required this.initializeControllerFuture, required this.controller});

  @override
  State<DisplayCameraImage> createState() => _DisplayCameraImageState();
}

class _DisplayCameraImageState extends State<DisplayCameraImage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cameraImageContainerDecoration(),
      height: 450,
      width: 300,
      child: FutureBuilder<void>(
        future: widget.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: 1,
                child: CameraPreview(widget.controller)
                )
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}