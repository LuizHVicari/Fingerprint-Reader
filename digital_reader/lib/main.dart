import 'package:camera/camera.dart';
import 'package:digital_reader/controlllers/login_controller.dart';
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
        '/': (context) => loginIsValid() ? HomePage() : LoginPage() ,
        '/gathering': (context) => GatheringPage(camera: firstCamera,),
        '/new_baby': (context) => const NewBabyPage(),
        '/login' : (context) => const LoginPage()
      },
      theme: ThemeData.light(),
      )
  );
}

  bool loginIsValid() {
    if (LoginController.instance.login == '') {
      return false;
    }
    if (LoginController.instance.password == '') {
      return false;
    }
    if (LoginController.instance.token == '') {
      return false;
    }
    return true;
  }