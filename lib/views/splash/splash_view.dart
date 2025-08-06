import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../home/home_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // ⏱️ 3 saniye bekle ve HomeView'e geç
    Future.delayed(Duration(seconds: 60), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 🖤 Arka plan siyah
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🖼️ Logo (sabit, büyüyüp küçülmüyor)
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50), // ↕️ Boşluk
            // ✨ Animasyonlu slogan (Tech sabit, ikinci kelime kayan)
            buildAnimatedSlogan(),
          ],
        ),
      ),
    );
  }

 // 🔹 Method: Animasyonlu slogan
  Container buildAnimatedSlogan() {
    return Container(
            width: 300, // 🛡️ Sabit genişlik
            height: 50, // 🛡️ Sabit yükseklik
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🅰️ Sabit kelime
                Text(
                  'Tech',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10), // ➡️ Arada boşluk
                // 🔄 Kayan kelimeler
                Container(
                  width: 150, // 🔒 Sabit genişlik
                  height: 120,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText('Build'),
                        RotateAnimatedText('Innovate'),
                        RotateAnimatedText('Create'),
                        RotateAnimatedText('Explore'),
                      ],
                      repeatForever: true, // 🔁 Sonsuz tekrar
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
