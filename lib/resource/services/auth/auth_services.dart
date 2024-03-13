import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_coffee_application/model/user_model.dart';
import 'package:flutter_coffee_application/resource/const_resource.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  // Google Sign in

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
