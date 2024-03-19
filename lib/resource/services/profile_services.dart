import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_coffee_application/model/user_model.dart';

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

  Future<ModelUser> fetchLoginData(var user) async {
    final userData = body.first;
    return ModelUser.fromJson(userData);
  }
}
