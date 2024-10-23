// Bu, temel bir Flutter widget testi.
//
// Testinizde bir widget ile etkileşimde bulunmak için flutter_test paketindeki
// WidgetTester aracını kullanın. Örneğin, dokunma ve kaydırma
// hareketlerini gönderebilirsiniz. Ayrıca, WidgetTester ile
// widget ağacındaki alt widget'ları bulabilir, metin okuyabilir
// ve widget özelliklerinin değerlerini doğrulayabilirsiniz.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intro_screen/main.dart'; // Test edilecek uygulamanın ana dosyası

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Uygulamayı oluştur ve bir çerçeve tetikle.
    await tester.pumpWidget(const MyApp(introShown: false,)); // MyApp widget'ını başlangıç durumu ile başlat

    // Sayacın başlangıçta 0 olduğunu doğrula.
    expect(find.text('0'), findsOneWidget); // '0' metninin bir kere bulunmasını bekle
    expect(find.text('1'), findsNothing); // '1' metninin hiç bulunmamasını bekle

    // '+' simgesine tıkla ve bir çerçeve tetikle.
    await tester.tap(find.byIcon(Icons.add)); // '+' ikonuna tıklama
    await tester.pump(); // Değişiklikleri güncelle

    // Sayacın arttığını doğrula.
    expect(find.text('0'), findsNothing); // '0' metninin artık bulunmamasını bekle
    expect(find.text('1'), findsOneWidget); // '1' metninin bir kere bulunmasını bekle
  });
}
