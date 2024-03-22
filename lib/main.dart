import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/Page/OnBoarding.dart';
import 'package:flutter_coffee_application/Page/auth/auth_page.dart';
import 'package:flutter_coffee_application/Page/home.dart';
import 'package:flutter_coffee_application/firebase_options.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_coffee_application/style/typhography.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nb_utils/nb_utils.dart';

late SharedPreferences sp;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSharedPreferences();
  await Firebase.initializeApp(
      name: "coffee-shop-project123",
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initializeSharedPreferences() async {
  sp = await SharedPreferences.getInstance();
}
// void main() {
//   runApp(const ProviderScope(child: MyApp()));
//

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: primary,
          ),
          hintStyle: body3(color: primary),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryDark,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primary, width: 3),
          ),
        ),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
