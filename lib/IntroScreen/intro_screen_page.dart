import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intro_screen/home_page.dart'; // Home sayfası
import 'package:intro_screen/IntroScreen/intro_screen_page_card.dart'; // Giriş ekranı kartı bileşeni
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Sayfa göstergesi

class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({super.key});

  @override
  State<IntroScreenPage> createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  static final PageController _pageController = PageController(initialPage: 0); // Sayfa kontrolcüsü

  // Giriş ekranındaki sayfalar listesi
  final List<Widget> _introScreenPages = [];

  @override
  void initState() {
    super.initState();
    // Giriş ekranı kartlarının listesini oluştur
    _introScreenPages.addAll([
      IntroScreenPageCard(
        image: "assets/whip-5156_256.gif", // Kartın görüntüsü
        title: "Title 1", // Kartın başlığı
        description: "Description 1", // Kartın açıklaması
        buttonText: "Next", // Buton metni
        onPressed: () {
          // "Next" butonuna basıldığında bir sonraki sayfaya geç
          _pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
      IntroScreenPageCard(
        image: "assets/feather-13992_256.gif", // Kartın görüntüsü
        title: "Title 2", // Kartın başlığı
        description: "Description 2", // Kartın açıklaması
        buttonText: "Next", // Buton metni
        onPressed: () {
          // "Next" butonuna basıldığında bir sonraki sayfaya geç
          _pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
      IntroScreenPageCard(
        image: "assets/flying-7288_256.gif", // Kartın görüntüsü
        title: "Title 3", // Kartın başlığı
        description: "Description 3", // Kartın açıklaması
        buttonText: "Done", // Buton metni
        onPressed: () async {
          // "Done" butonuna basıldığında Hive kutusuna veri kaydet ve ana sayfaya geç
          var box = Hive.box('introBox'); // Hive kutusunu aç
          await box.put('introShown', true); // 'introShown' anahtarına true değeri yaz

          // Navigator of context'i build metodu içinde güvenli şekilde kullanın
          if (mounted) {
            // Eğer bileşen hâlâ montajlıysa, ana sayfaya geç
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(), // Ana sayfaya yönlendir
              ),
            );
          }
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow, // Arka plan rengi
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0), // Dikey boşluk
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Dikey merkezleme
          mainAxisSize: MainAxisSize.max, // Tüm alanı kaplama
          crossAxisAlignment: CrossAxisAlignment.center, // Yatay merkezleme
          children: [
            // PageView widget'ı
            Expanded(
              child: PageView(
                controller: _pageController, // Sayfa kontrolcüsü
                children: _introScreenPages, // Sayfa bileşenleri
              ),
            ),
            // Sayfa göstergesi (SmoothPageIndicator)
            SmoothPageIndicator(
              controller: _pageController, // Sayfa kontrolcüsü
              count: _introScreenPages.length, // Sayfa sayısı
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.primary, // Aktif nokta rengi
                dotColor: Theme.of(context).colorScheme.secondary, // Pasif nokta rengi
              ),
              onDotClicked: (index) {
                // Dota tıklandığında sayfayı değiştir
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300), // Geçiş süresi
                  curve: Curves.linear, // Geçiş eğrisi
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
