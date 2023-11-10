import 'package:flutter/material.dart';
import 'package:prova_flutter/components/campo_password.dart';
import 'package:prova_flutter/components/campo_user.dart';
import 'package:prova_flutter/utils/custom_background.dart';
import 'package:prova_flutter/utils/url_launcher_helper.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: CustomDecorations.gradientBoxDecoration(),
        child: SafeArea(
          child: Center(
            child: Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CampoUser(),
                  const CampoPassword(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (loginKey.currentState?.validate() ?? false) {
                            Navigator.pushNamed(context, 'notepad');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Text('Entrar'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: GestureDetector(
                      onTap: () {
                        launchURL('https://www.google.com.br');
                      },
                      child: const Text(
                        'Política de Privacidade',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
