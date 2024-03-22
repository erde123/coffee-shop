import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/Page/OnBoarding.dart';
import 'package:flutter_coffee_application/Page/admin/home_admin.dart';
import 'package:flutter_coffee_application/Page/admin/scanqr.dart';
import 'package:flutter_coffee_application/Page/home.dart';
import 'package:flutter_coffee_application/model/user_model.dart';
import 'package:flutter_coffee_application/resource/provider/auth/auth_provider.dart';
import 'package:flutter_coffee_application/resource/provider/profile_provider.dart';
import 'package:flutter_coffee_application/resource/services/auth/auth_services.dart';
import 'package:flutter_coffee_application/resource/services/profile_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            Future.microtask(() {
              ref.read(isLogin.notifier).update((state) => true);
            });
            return Consumer(
              builder: (context, ref, _) {
                final userData = ref.watch(profileDataProvider(snapshot.data));
                return userData.when(
                  data: (data) {
                    print("halo user data");
                    return data.roles == "admin" ? HomeAdmin() : Home();
                  },
                  error: (error, stackTrace) => SizedBox(),
                  loading: () => CircularProgressIndicator(),
                );
              },
            );
          } else {
            return OnBoarding();
          }
        },
      ),
    );
  }
}
