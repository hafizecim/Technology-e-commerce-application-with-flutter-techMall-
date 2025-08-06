import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🏗️ Ana sayfa taslağı
      body: Center(
        // 💬 Şimdilik placeholder text
        child: Text(
          "Home Screen - UI hazır değil, dummy olarak",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
