import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/Page/OnBoarding.dart';
import 'package:flutter_coffee_application/Page/admin/scanqr.dart';
import 'package:flutter_coffee_application/Page/home.dart';
import 'package:flutter_coffee_application/model/user_model.dart';
import 'package:flutter_coffee_application/resource/provider/auth/auth_provider.dart';
import 'package:flutter_coffee_application/resource/provider/profile_provider.dart';
import 'package:flutter_coffee_application/resource/services/auth/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Use Future.microtask to execute the update after the widget tree is built
            Future.microtask(() {
              ref.read(isLogin.notifier).update((state) => true);
            });
            return Home();
          } else {
            return OnBoarding();
          }
        },
      ),
    );
  }
}