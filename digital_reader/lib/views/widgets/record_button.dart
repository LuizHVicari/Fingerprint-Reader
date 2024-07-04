import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:digital_reader/views/pages/submit_fingerprint_page.dart';
import 'package:digital_reader/views/styles/icon_elevated_button_style.dart';
import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {
  final Future <void> initializeControllerFuture;
  final CameraController controller;
  const RecordButton({super.key, required this.initializeControllerFuture, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: iconElevatedButtonStyle(),
        onPressed: () async {
          try {
            await initializeControllerFuture;
            final image = await controller.takePicture();

            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => 
                DisplayPicturePage(image: image, controller: controller)
              )
            );  
          } catch (e) {
            log(e.toString());
          }
        },
      child: const Icon(Icons.camera_alt_outlined, color: Colors.white)
      ),
    );
  }
}