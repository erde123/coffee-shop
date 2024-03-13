import 'dart:convert';

import 'package:flutter_coffee_application/model/user_model.dart';

import '../const_resource.dart';

class profileServices {
  final List<Map<String, dynamic>> body = [
    {
      "id": "123",
      "name": "Ryan David",
      "gender": "Pria",
      "phone": "081234567899",
      "birthday": "2004-02-29",
      "createdAt": "2004-02-29",
      "point": 100,
      "roles": "admin"
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
    ModelUser data2 = ModelUser.fromJson(jsonDecode(bodys));
    return data2;
  }
}
