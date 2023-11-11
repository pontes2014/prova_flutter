import 'package:flutter/material.dart';
import 'package:prova_flutter/components/custom_Text_form_filed.dart';
import 'package:prova_flutter/services/api_services.dart';
import 'package:prova_flutter/utils/campo_password_validator.dart';
import 'package:prova_flutter/utils/custom_background.dart';
import 'package:prova_flutter/utils/url_launcher_helper.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final loginKey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;

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
                  CustomTextForm(
                    controller: userController,
                    label: 'Usuário',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Usuário obrigatório';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    controller: passwordController,
                    label: 'Senha',
                    isPassword: true,
                    showPassword: _showPassword,
                    onChanged: (value) {},
                    validator: CampoPasswordValidator.validatePassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (loginKey.currentState?.validate() ?? false) {
                            final enteredUser = userController.text;
                            final enteredPassword = passwordController.text;

                            final mockUsers =
                                await MockApiService.getMockUsers();
                            final validUser = mockUsers.any((user) =>
                                user['email'] == enteredUser &&
                                user['password'] == enteredPassword);

                            if (validUser) {
                              Navigator.pushNamed(context, 'notepad');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login inválido'),
                                ),
                              );
                            }
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
