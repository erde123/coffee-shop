// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/Page/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

import '../../component/Button.dart';
import '../../component/TextField.dart';
import '../../style/color.dart';
import '../../style/typhography.dart';

class SignUp extends ConsumerStatefulWidget {
  bool googleSignIn;
  SignUp({super.key, required this.googleSignIn});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final emailNode = FocusNode();
  final passNode = FocusNode();
  final namaNode = FocusNode();
  bool validate = false;
  bool waValidate = false;
  bool refValidate = false;
  bool enable = false;
  int maxLength = 13;
  int textLength = 0;

  @override
  void initState() {
    email.addListener(validateInputs);
    pass.addListener(validateInputs);
    emailNode.addListener(_onFocusChange);
    passNode.addListener(_onFocusChange);
    namaNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    emailNode.removeListener(_onFocusChange);
    passNode.removeListener(_onFocusChange);
    namaNode.removeListener(_onFocusChange);
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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: grey3,
                    height: 120,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Align(
                            child: Text(
                              "Daftar",
                              style: h2(color: primary),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 0,
                          left: 20,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primary,
                                  width: 2.3,
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: primary,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Visibility(
                              visible: widget.googleSignIn,
                              child: Container(
                                margin: const EdgeInsets.only(top: 30),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                color: grey3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          AssetImage("assets/image/google.png"),
                                      radius: 12,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "Terhubung dengan Google",
                                      style: h5(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Masukkan Email",
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
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Masukkan Password",
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
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Masukkan Nama",
                                    style: h2(color: primary),
                                  ),
                                  TextFormField(
                                    focusNode: namaNode,
                                    // controller: _controller,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      suffixIconConstraints:
                                          BoxConstraints(minHeight: 24, minWidth: 24),
                                      suffixIcon: namaNode.hasFocus
                                          ? Text(
                                              "${textLength.toString()}/${maxLength.toString()}")
                                          : null,
                                      labelText: textLength > 0 ? 'Nama*' : null,
                                      hintText: 'Nama*'
                                    ),
                                    maxLength: 13,
                                    onChanged: (value) {
                                      setState(() {
                                        textLength = value.length;
                                      });
                                    },
                                  ),
                                  // TextField isi nama
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "LAINNYA",
                                    style: h3(color: grey2),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nyalakan notifikasi Whatsapp",
                                            style: body2(),
                                          ),
                                          Text(
                                            "*Atur pengiriman notifikasi lainnya di pengaturan",
                                            style: body3(color: grey1),
                                          ),
                                        ],
                                      ),
                                      Switch.adaptive(
                                        activeTrackColor: primary,
                                        inactiveTrackColor: grey3,
                                        inactiveThumbColor: grey1,
                                        value: waValidate,
                                        onChanged: (bool value) {
                                          setState(() {
                                            waValidate = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Saya punya kode referal",
                                        style: body2(),
                                      ),
                                      Switch.adaptive(
                                        activeTrackColor: primary,
                                        inactiveTrackColor: grey3,
                                        inactiveThumbColor: grey1,
                                        value: refValidate,
                                        onChanged: (bool value) {
                                          setState(() {
                                            refValidate = value;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 20,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: ButtonSubmit(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Home(),
                                      type: PageTransitionType.rightToLeft),
                                );
                              },
                              height: 55,
                              child: Text(
                                "Simpan & Lanjutkan",
                                style: h3(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
