import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_coffee_application/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../const_resource.dart';

class profileServices {
  // final List<Map<String, dynamic>> body = [
  //   {
  //     "id": "123",
  //     "name": "Ryan David",
  //     "gender": "Pria",
  //     "phone": "081234567899",
  //     "birthday": "2004-02-29",
  //     "createdAt": "2004-02-29",
  //     "point": 100,
  //     "roles": "admin"
  //   },
  // ];

  // Future<ModelUser> fetchLoginData(var user) async {
  //   final userData = body.first;
  //   return ModelUser.fromJson(userData);
  // }

  Future<ModelUser> fetchProfile() async {
    try {
      final link = Uri.parse("$url/imavi/users/profile");
      Map<String, String> headers = {
        "Id": "628c318b0a1b551f2a8fb6ee",
        "Secret": "edc02803-82a4-4473-b5bd-888f064d7436",
        "partner": "garum",
        'Authorization': 'Bearer ${sp.getString('token')}'
      };

      final response = await http
          .get(
            Uri.parse('${url}garum/users/profile'),
            headers: headers,
          )
          .timeout(Duration(seconds: apiWaitTime));
      print("Response: " + response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        ModelUser data = ModelUser.fromJson(jsonDecode(response.body));
        print('data profile ${data.fullName}');
        await sp.setString("fullName", data.fullName);
        await sp.setInt("point", data.point);
        return data;
      } else {
        if (response.statusCode == 401 &&
            jsonDecode(response.body)["message"] ==
                "Authorization token expired") {
          await sp.remove("token");
          return Future.error(response.statusCode.toString());
        }
        throw Exception(response.statusCode);
      }
    } on TimeoutException {
      // await sp.remove("token");
      rethrow;
    } catch (e) {
      // await sp.remove("token");
      rethrow;
    }
  }
}
