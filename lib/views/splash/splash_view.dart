import 'package:flutter/material.dart';
import '../home/home_view.dart'; // 🏠 Home ekranına yönlendirme

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    // ⏱️ 3 saniye bekle ve ardından HomeView'e geç
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeView()), // 🏠 Home ekranına geçiş
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        // 🖼️ Ortada logo göster
        child: Image.asset(
          'assets/images/logo.png', // 📂 images klasöründeki logo
          width: 200, // ↔️ Genişlik
          height: 200, // ↕️ Yükseklik
        ),
      ),
    );
  }
}
