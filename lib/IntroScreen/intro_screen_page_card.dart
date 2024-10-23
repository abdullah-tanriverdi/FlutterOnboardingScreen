import 'package:flutter/material.dart';

class IntroScreenPageCard extends StatelessWidget {
  final String image; // Kartın gösterilecek resmi
  final String title; // Kartın başlığı
  final String description; // Kartın açıklaması
  final String buttonText; // Buton üzerindeki metin
  final Function onPressed; // Butona tıklandığında çalışacak fonksiyon

  const IntroScreenPageCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Ekranın yüksekliğini ve genişliğini al
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.8, // Kartın yüksekliği ekranın %80'i
      width: screenWidth, // Kartın genişliği ekranın tamamı
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Elemanları dikey olarak eşit şekilde dağıt
        crossAxisAlignment: CrossAxisAlignment.center, // Elemanları yatay olarak ortala
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0), // Resmin etrafındaki boşluk
            child: Image.asset(image, fit: BoxFit.contain), // Resmi yükle
          ),
          Column(
            children: [
              Text(
                title, // Başlık metni
                textAlign: TextAlign.center, // Metni ortala
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, // Başlık rengi
                  fontSize: 25, // Başlık font boyutu
                  fontWeight: FontWeight.bold, // Başlık kalınlığı
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0), // Açıklama metninin etrafındaki boşluk
                child: Text(
                  description, // Açıklama metni
                  textAlign: TextAlign.center, // Metni ortala
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary, // Açıklama rengi
                    fontSize: 15, // Açıklama font boyutu
                    fontWeight: FontWeight.w300, // Açıklama kalınlığı
                  ),
                ),
              ),
            ],
          ),
          MaterialButton(
            minWidth: 300, // Butonun minimum genişliği
            onPressed: () => onPressed(), // Butona tıklandığında çalışacak fonksiyon
            color: Theme.of(context).colorScheme.primary, // Butonun rengi
            child: Text(
              buttonText, // Buton üzerindeki metin
              style: const TextStyle(color: Colors.white), // Buton metni rengi
            ),
          ),
        ],
      ),
    );
  }
}
