import 'package:flutter/material.dart';
import 'package:prova_flutter/view/initial_screen.dart';
import 'package:prova_flutter/view/notepad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialScreen(),
        'notepad': (context) => Notepad(),
      },
    );
  }
}
