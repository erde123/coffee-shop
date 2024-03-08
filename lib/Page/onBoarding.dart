import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/Page/auth/login.dart';
import 'package:flutter_coffee_application/Page/auth/signup.dart';
import 'package:flutter_coffee_application/Page/home.dart';
import 'package:flutter_coffee_application/component/Button.dart';
import 'package:flutter_coffee_application/resource/services/auth/auth_services.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primary,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                final double height = MediaQuery.of(context).size.height;
                return CarouselSlider(
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
                );
              },
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
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
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ButtonOutline(
                    onPressed: () {
                      AuthServices().signInWithGoogle();
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //       child: Home(),
                      //       type: PageTransitionType.rightToLeft),
                      // );
                    },
                    width: MediaQuery.of(context).size.width - 32,
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/image/google.png"),
                          radius: 12,
                        ),
                        Text(
                          "Lanjutkan dengan Google",
                          style: h3(
                            color: primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: Text(
                      "Lewati tahap Ini",
                      style: h3(
                        color: primary,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: Home(),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
