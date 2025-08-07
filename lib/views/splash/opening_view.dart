import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'splash_view.dart'; // SplashView'e geçiş için

class OpeningView extends StatefulWidget {
  @override
  _OpeningViewState createState() => _OpeningViewState();
}

class _OpeningViewState extends State<OpeningView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SplashView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(alignment: Alignment.center, child: opiningAnimated()),
          ],
        ),
      ),
    );
  }

  SizedBox opiningAnimated() {
    return SizedBox(
      
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w300,

          //fontFamily:
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText('الله'),
            FadeAnimatedText('بسم الله الرحمن الرحيم'),
            //FadeAnimatedText('do it RIGHT NOW!!!'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}
