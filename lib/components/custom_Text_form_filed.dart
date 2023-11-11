import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool showPassword;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextForm({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.showPassword = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 12),
              child: Text(
                widget.label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              validator: widget.validator,
              obscureText: widget.isPassword ? !_showPassword : false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  widget.isPassword ? Icons.lock : Icons.person,
                  color: Colors.black,
                ),
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
