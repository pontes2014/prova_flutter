import 'package:flutter/material.dart';

class CampoUser extends StatefulWidget {
  const CampoUser({Key? key}) : super(key: key);

  @override
  State<CampoUser> createState() => _CampoUserState();
}

class _CampoUserState extends State<CampoUser> {
  final TextEditingController _usuarioController = TextEditingController();

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
              child: Text('Usuário',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              controller: _usuarioController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Usuário obrigatório';
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
