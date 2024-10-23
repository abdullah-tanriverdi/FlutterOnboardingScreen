import 'package:flutter/material.dart';
import 'package:intro_screen/IntroScreen/intro_screen_page_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({super.key});

  @override
  State<IntroScreenPage> createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  static final PageController _pageController = PageController(initialPage: 0);

  // Giriş ekranındaki sayfalar listesi
  final List<Widget> _introScreenPages = [
    IntroScreenPageCard(
      image: "assets/whip-5156_256.gif",
      title: "Title 1",
      description: "Description 1",
      buttonText: "Next",
      onPressed: () {
        _pageController.animateToPage(
          1,
          duration: Durations.long1,
          curve: Curves.linear,
        );
      },
    ),

    IntroScreenPageCard(
      image: "assets/feather-13992_256.gif",
      title: "Title2 ",
      description: "Description2 ",
      buttonText: "Next",
      onPressed: () {
        _pageController.animateToPage(
          2,
          duration: Durations.long1,
          curve: Curves.linear,
        );
      },
    ),

    IntroScreenPageCard(
      image: "assets/flying-7288_256.gif",
      title: "Title 3",
      description: "Description 3",
      buttonText: "Done",
      onPressed: () {

      },
    ),





  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // PageView widget'ı
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _introScreenPages,
              ),
            ),
            // Sayfa göstergesi (SmoothPageIndicator)
            SmoothPageIndicator(
              controller: _pageController,
              count: _introScreenPages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Theme.of(context).colorScheme.secondary,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Durations.long1,
                  curve: Curves.linear,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}