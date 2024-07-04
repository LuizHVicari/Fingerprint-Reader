import 'package:camera/camera.dart';
import 'package:digital_reader/views/pages/gathering_page.dart';
import 'package:digital_reader/views/pages/home_page.dart';
import 'package:digital_reader/views/pages/new_baby_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras[1];

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(
    MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        Locale('pt')
      ],
      routes: {
        '/': (context) => const HomePage(),
        '/gathering': (context) => GatheringPage(camera: firstCamera,),
        '/new_baby': (context) => const NewBabyPage(),
      },
      theme: ThemeData.light(),
      )
  );
}