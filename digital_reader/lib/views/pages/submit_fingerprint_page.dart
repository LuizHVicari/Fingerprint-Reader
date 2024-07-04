import 'dart:io';
import 'package:camera/camera.dart';
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
  double _ageSliderValue = 0.0;
  List<String> ids = ['item 1', 'item 2', 'item 3', 'item 4'];
  String selectedId = '';
  
  void saveImage() async {
    //! NOT WORKING
    await Gal.putImage(widget.image.path);
  }

  @override
  void initState() {
    super.initState();
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
              ageSlider(),
              codeText(context),
              codeRow(context),
              const SizedBox(height: 30),
              submitButton(context),
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
    return const Text(
      'Por favor, verifique a qualidade da imagem',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15
      ),
    );
  }

  FloatingActionButton submitButton(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.teal,
      label: const Text(
        'Enviar dados',
        style: TextStyle(
          color: Colors.white
        ),),
      icon: const Icon(Icons.send, color: Colors.white,),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return const AlertDialog(
              title: Text(
                textAlign: TextAlign.center,
                'Formulário enviado',
                style: TextStyle(
                  fontSize: 15,
                ),),
            );
          }
        ).then((value) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
        });
      }
    );
  }

  Row codeRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownMenu(
          hintText: 'Código do bebê',
          enableFilter: true,
          enableSearch: true,
          dropdownMenuEntries: ids.map((map) {
            return DropdownMenuEntry(
              value: map,
              label: map
            );
          }).toList()
        ),
        const Text('ou'),
        FloatingActionButton.extended(
          backgroundColor: Colors.teal.shade500,
          onPressed: () {
            Navigator.of(context).pushNamed('/new_baby');
          }, 
          label: const Text(
            'Novo bebê',
            style: TextStyle(color: Colors.white)
            ),
          icon: const Icon(Icons.add, color: Colors.white)
        ),
      ],
    );
  }

  Slider ageSlider() {
    return Slider(
      value: _ageSliderValue, 
      max: 12,
      min: 0,
      label: _ageSliderValue.toInt().toString(),
      divisions: 12,
      activeColor: Colors.teal.shade500,
      onChanged: (double value) {
        setState(() {
          _ageSliderValue = value;
        });
      }
    );
  }
}