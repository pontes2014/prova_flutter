import 'package:flutter/material.dart';
import 'package:prova_flutter/utils/campo_password_validator.dart';

class CampoPassword extends StatefulWidget {
  const CampoPassword({super.key});

  @override
  State<CampoPassword> createState() => _CampoPasswordState();
}

class _CampoPasswordState extends State<CampoPassword> {
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 12),
              child:
                  Text('Senha', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              controller: _passwordController,
              validator:  CampoPasswordValidator.validatePassword,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _showPassword == false
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  )),
              obscureText: _showPassword == false ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
