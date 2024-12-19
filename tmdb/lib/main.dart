import 'package:flutter/material.dart';
import 'main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheMovieDB App',
      theme: ThemeData(
        useMaterial3: true, // Activa Material You
        colorSchemeSeed: Colors.deepPurple, // Define un color principal
        brightness: Brightness.light, // También puedes usar dark
      ),
      home: MainMenuScreen(),
    );
  }
}
