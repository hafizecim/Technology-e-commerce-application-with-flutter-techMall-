// support_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Tawk(
          directChatLink: 'https://tawk.to/chat/6894be59be377c1922833b54/1j22gf3ed',
          visitor: TawkVisitor(
            name: 'Hafize Şenyıl',
            email: 'test@gmail.com',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
      ),
    );
  }
}