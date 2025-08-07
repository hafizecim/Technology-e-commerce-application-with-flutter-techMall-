import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Sayfası',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(title: const Text('Hesabım')),
        body: ProfileScreen(
          actions: [
            SignedOutAction((context) {
              // Örnek: Giriş ekranına yönlendir
              Navigator.pushReplacementNamed(context, '/sign-in');
            }),
            AuthCancelledAction((context) {
              Navigator.pushReplacementNamed(context, '/sign-in');
            }),
          ],
          showMFATile:
              kIsWeb ||
              platform == TargetPlatform.iOS ||
              platform == TargetPlatform.android,
          showUnlinkConfirmationDialog: true,
          showDeleteConfirmationDialog: true,
        ),
      ),
      routes: {
        '/sign-in': (context) => SignInScreen(
          actions: [
            ForgotPasswordAction((context, email) {
              Navigator.pushNamed(
                context,
                '/forgot-password',
                arguments: {'email': email},
              );
            }),
            AuthStateChangeAction((context, state) {
              // state'i türüne göre kontrol et
              if (state is SignedIn) {
                final user = state.user;
                // user var ise yönlendirme
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/');
                }
              } else if (state is CredentialLinked) {
                final user = state.user;
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/');
                }
              } else if (state is UserCreated) {
                final user = state.credential.user;
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/');
                }
              }
            }),
          ],
        ),
        // Diğer rotalar eklenebilir
      },
    );
  }
}
