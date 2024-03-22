import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/Page/admin/home_admin.dart';
import 'package:flutter_coffee_application/Page/admin/scanqr.dart';
import 'package:flutter_coffee_application/Page/auth/auth_page.dart';
import 'package:flutter_coffee_application/Page/auth/login.dart';
import 'package:flutter_coffee_application/Page/auth/signup.dart';
import 'package:flutter_coffee_application/Page/home.dart';
import 'package:flutter_coffee_application/component/Button.dart';
import 'package:flutter_coffee_application/resource/services/auth/auth_services.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../component/TextField.dart';
import '../style/typhography.dart';

class OnBoarding extends ConsumerStatefulWidget {
  const OnBoarding({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends ConsumerState<OnBoarding> {
  final List<String> imageList = [
    'assets/image/ver1.jpeg',
    'assets/image/ver2.jpeg',
    'assets/image/ver3.jpeg',
  ];
  final email = TextEditingController();
  final pass = TextEditingController();
  final emailNode = FocusNode();
  final passNode = FocusNode();
  bool validate = false;
  bool enable = false;

  @override
  void initState() {
    email.addListener(validateInputs);
    pass.addListener(validateInputs);
    emailNode.addListener(_onFocusChange);
    passNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    emailNode.removeListener(_onFocusChange);
    passNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void validateInputs() {
    if (email.text.isEmpty || pass.text.isEmpty) {
      setState(() {
        enable = false;
      });
    } else {
      setState(() {
        enable = true;
      });
    }
  }

  void _onFocusChange() {
    debugPrint("Email Focus: ${emailNode.hasFocus.toString()}");
    debugPrint("Pass Focus: ${passNode.hasFocus.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              color: primary,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      final double height = MediaQuery.of(context).size.height;
                      return Positioned.fill(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            height: height,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                          ),
                          items: imageList
                              .map((item) => Container(
                                    child: Center(
                                        child: Image.asset(
                                      item,
                                      fit: BoxFit.cover,
                                      height: height,
                                    )),
                                  ))
                              .toList(),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [
                            0.1,
                            0.2,
                            0.3,
                            0.6,
                          ],
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.7),
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan email",
                            style: h2(color: primary),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LoginTextField(
                            focus: emailNode,
                            controller: email,
                            textInputType: TextInputType.emailAddress,
                            error: validate ? "belum diisi" : null,
                            hint: "email",
                            type: "email",
                            onNext: () => FocusScope.of(context).requestFocus(
                                passNode), // Focus on password TextField
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Masukkan password",
                            style: h2(color: primary),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LoginTextField(
                            focus: passNode,
                            controller: pass,
                            textInputType: TextInputType.text,
                            error: validate ? "belum diisi" : null,
                            hint: "password",
                            type: "pass",
                          ),
                          const SizedBox(
                            height: 65,
                          ),
                          ButtonSubmit(
                            enable: enable,
                            onPressed: () async {
                              setState(() {
                                validate = email.text.isEmpty;
                                validate = pass.text.isEmpty;
                              });

                              if (!validate) {
                                try {
                                  final UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                    email: email.text,
                                    password: pass.text,
                                  );
                                  // Authentication successful, navigate to appropriate page
                                  if (userCredential.user != null) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeAdmin()), // Navigate to Home page after successful authentication
                                    );
                                  }
                                } catch (e) {
                                  // Handle authentication errors here
                                  print("Error signing in: $e");
                                  // You can show an error message to the user using a snackbar or dialog
                                }
                              }
                            },
                            width: MediaQuery.of(context).size.width - 40,
                            height: 55,
                            child: Text(
                              "Lanjutkan",
                              style: h3(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
