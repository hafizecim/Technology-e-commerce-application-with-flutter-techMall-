import 'package:flutter/material.dart'; // 📦 Flutter'ın temel UI kütüphanesi
import 'package:tech_mall/views/splash/opening_view.dart';
// import 'views/splash/splash_view.dart'; // 🏁 Splash ekranını import et ( ekran 2 3 sn görünecek sonra home sayfasına yönlendirilecek)

void main() {
  runApp(MyApp()); // 🚀 Uygulamayı başlat
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ❌ Debug banner kapat
      title: 'TechMall', // 🏷️ Uygulama başlığı
      theme: ThemeData(
        primarySwatch: Colors.blue, // 🎨 Ana tema rengi
        fontFamily: 'Poppins', // 🔤 Font tercihi
      ),
      //home: SplashView(), // 🏁 Uygulama Splash ekranı ile başlasın
      home:  OpeningView(), // 🏁 Uygulama Opening ekranı ile başlasın
    );
  }
}
