import 'package:digital_reader/controlllers/login_controller.dart';
import 'package:digital_reader/views/styles/elevated_button_style.dart';
import 'package:digital_reader/views/styles/important_text_style.dart';
import 'package:digital_reader/views/widgets/email_input.dart';
import 'package:digital_reader/views/widgets/password_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Faça login para continuar'.toUpperCase(),
              style: importantTextStyle(),
            ),
            const SizedBox(height: 20),
            const EmailInput(),
            const SizedBox(height: 20),
            const PasswordInput(),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                // TODO add login logic
                LoginController.instance.token = 'teste';
                Navigator.of(context).popAndPushNamed('/');
              },
              child: const Text('Login')
            )
          ],
        )
      ),
    );
  }

  

  
}

