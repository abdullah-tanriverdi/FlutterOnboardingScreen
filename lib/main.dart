import 'package:flutter/material.dart';
import 'package:intro_screen/IntroScreen/intro_screen_page.dart'; // IntroScreenPage'i içe aktarın

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreenPage(), // IntroScreenPage'i burada kullanıyoruz
    );
  }
}
