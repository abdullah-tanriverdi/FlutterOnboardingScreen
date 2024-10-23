import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Yapıcı fonksiyon, anahtar argümanı alır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"), // Uygulama çubuğundaki başlık
      ),
      body: const Center(
        child: Text("Welcome to the Home Page!"), // Merkezde gösterilecek metin
      ),
    );
  }
}
