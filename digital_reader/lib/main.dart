import 'package:camera/camera.dart';
import 'package:digital_reader/controllers/login_controller.dart';
import 'package:digital_reader/views/pages/gathering_page.dart';
import 'package:digital_reader/views/pages/home_page.dart';
import 'package:digital_reader/views/pages/login_page.dart';
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
      localizationsDelegates: GlobalMaterialLocalizations.delegates
      ,
      supportedLocales: const [
        Locale('pt')
      ],
      routes: {
        '/': (context) => LoginController.instance.isLogged ? const HomePage() : const LoginPage() ,
        '/gathering': (context) => LoginController.instance.isLogged ? GatheringPage(camera: firstCamera,) : const LoginPage(),
        '/new_baby': (context) => LoginController.instance.isLogged ? const NewBabyPage() : const LoginPage(),
        '/login' : (context) => LoginController.instance.isLogged ? const LoginPage() : const LoginPage()
      },
      theme: ThemeData.light(),
      )
  );
}