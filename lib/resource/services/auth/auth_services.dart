import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_coffee_application/model/user_model.dart';
import 'package:flutter_coffee_application/resource/const_resource.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';

class AuthServices {
  // Google Sign in

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      if (kDebugMode) print('something went wrong: $e');
    }
  }

  Future<UserCredential?> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<Map<String, dynamic>> login(User user) async {
    try {
      Map<String, String> headers = {
        "Id": "628c318b0a1b551f2a8fb6ee",
        "Secret": "edc02803-82a4-4473-b5bd-888f064d7436",
        "Content-Type": "application/json",
        "partner": "garum",
      };
      Map<String, dynamic> dataBody = {
        "uid": user.uid,
        "displayName": user.displayName,
        "email": user.email,
        "phoneNumber": user.phoneNumber,
        "photoURL": user.photoURL,
        "refreshToken": user.refreshToken
      };
      final response = await http
          .post(
            Uri.parse('${url}garum/users/login-shop'),
            headers: headers,
            body: jsonEncode(dataBody),
          )
          .timeout(Duration(seconds: apiWaitTime));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        await sp.setString("token", jsonDecode(response.body)["profileToken"]);
        print(response.body);
        return data;
      } else {
        print('Error login');
        print(response.body);
        return json.decode(response.body);
      }
    } catch (e) {
      var dataError = {
        'statusCode': 401,
        'message': "Terjadi kesalahan di server"
      };
      print(dataError);
      return dataError;
    }
  }
}
