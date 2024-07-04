import 'package:camera/camera.dart';
import 'package:digital_reader/views/styles/important_text_style.dart';
import 'package:digital_reader/views/widgets/camera_image.dart';
import 'package:digital_reader/views/widgets/record_button.dart';
import 'package:digital_reader/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class GatheringPage extends StatefulWidget {
  final CameraDescription camera;
  const GatheringPage({super.key, required this.camera});

  @override
  State<GatheringPage> createState() => _GatheringPageState();
}

class _GatheringPageState extends State<GatheringPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera, 
      ResolutionPreset.medium, 
      // imageFormatGroup:ImageFormatGroup.
      );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: 'Nova Coleta'.toUpperCase(),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 70, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tire uma foto para seguir com a coleta',
              textAlign: TextAlign.center,
              style: importantTextStyle(),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                DisplayCameraImage(
                  camera: widget.camera, 
                  controller: _controller, 
                  initializeControllerFuture: _initializeControllerFuture
                ),
                RecordButton(
                  initializeControllerFuture: _initializeControllerFuture, 
                  controller: _controller),
            // const SizedBox(height: 10,),
              ],
            )
          ],
        ),
      ),
    );
  }

}

