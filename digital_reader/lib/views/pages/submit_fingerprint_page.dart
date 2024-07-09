import 'dart:io';
import 'package:camera/camera.dart';
import 'package:digital_reader/controllers/baby_controller.dart';
import 'package:digital_reader/models/baby_model.dart';
import 'package:digital_reader/views/styles/important_text_style.dart';
import 'package:digital_reader/views/widgets/age_slider.dart';
import 'package:digital_reader/views/widgets/code_input_row.dart';
import 'package:digital_reader/views/widgets/submit_fingerprint_button.dart';
import 'package:digital_reader/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';

class DisplayPicturePage extends StatefulWidget {
  final XFile image;
  final CameraController controller;

  const DisplayPicturePage({super.key, required this.image, required this.controller});

  @override
  State<DisplayPicturePage> createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends State<DisplayPicturePage> {
  late List<BabyModel> babyList = [];
  String selectedId = '';
  
  void saveImage() async {
    //! NOT WORKING
    await Gal.putImage(widget.image.path);
  }

  @override
  void initState() {
    super.initState();
    BabyController.instance.getBabies().then((value) {
      setState(() {
        BabyController.instance.babyList = value!;
      });
    });

    saveImage();
    widget.controller.pausePreview();
  }

  @override
  void dispose() {
    widget.controller.resumePreview();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: const TopBar(title: 'Formulário dos dados da captura'),
      body: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageQualityText(),
              Image.file(File(widget.image.path)),
              imageNotFitText(),
              ageText(context),
              AgeSlider(),
              codeText(context),
              CodeInputRow(babies: BabyController.instance.babyList),
              const SizedBox(height: 30),
              const SubmitFingerprintButton(),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Container codeText(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 15, bottom: 2),
      child: const Text('Informe o código do bebê')
      );
  }

  Container ageText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 20),
      width: MediaQuery.of(context).size.width,
      child: const Text(
        'Informe quantos meses o bebê tem:',
        textAlign: TextAlign.start)
    );
  }

  Text imageNotFitText() {
    return const Text(
      'Caso a imagem não esteja adequada, faça a captura novamente',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15
      ),
    );
  }

  Text imageQualityText() {
    return Text(
      'Por favor, verifique a qualidade da imagem',
      textAlign: TextAlign.center,
      style: importantTextStyle(),
    );
  }
}