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

  final List<Map<String, dynamic>> body = [
    {
      "id": "123",
      "name": "Ryan David",
      "gender": "Pria",
      "phone": "081234567899",
      "birthday": "2004-02-29",
      "createdAt": "2004-02-29",
      "point": 100
    },
  ];

  Future<dynamic> fetchLoginData(var user) async {
    final link = Uri.parse("$url/imavi/users/login");
    Map<String, String> data = {"user": user};
    var bodys = jsonEncode(data);
    // final response = await http.post(
    //   link,
    //   body: bodys,
    // );
    List<ModelUser> result = body.map((e) => ModelUser.fromJson(e)).toList();
    return result;
  }
}
