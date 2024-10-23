import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Hive veritabanı için Flutter uzantıları
import 'package:intro_screen/IntroScreen/intro_screen_page.dart'; // Giriş ekranı sayfası
import 'home_page.dart'; // Ana sayfa

void main() async {
  // Flutter widget'larının başlangıç bağlamını başlat
  WidgetsFlutterBinding.ensureInitialized();
  // Hive'ı başlat
  await Hive.initFlutter();
  // 'introBox' isimli Hive kutusunu aç
  var box = await Hive.openBox('introBox');
  // 'introShown' anahtarına karşılık gelen değeri al, yoksa false döndür
  bool? introShown = box.get('introShown', defaultValue: false);

  // Uygulamayı başlat
  runApp(MyApp(introShown: introShown!)); // introShown değeri ile MyApp'i başlat
}

class MyApp extends StatelessWidget {
  final bool introShown; // Giriş ekranının gösterilip gösterilmeyeceğini belirten değişken

  const MyApp({super.key, required this.introShown}); // Yapıcı fonksiyon

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Uygulamanın ana sayfası
      home: introShown ? const HomePage() : const IntroScreenPage(), // Giriş ekranını veya ana sayfayı göster
    );
  }
}
