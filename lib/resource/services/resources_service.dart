import 'dart:async';

import 'package:flutter_coffee_application/model/category_model.dart';
import 'package:flutter_coffee_application/model/product_model.dart';
import 'package:flutter_coffee_application/model/promo_model.dart';

import 'package:http/http.dart' as http;

class ApiServices {


  final List<Map<String, dynamic>> body2 = [
    {
      "promo": "Diskon 50%",
      "deskripsi": "Yuk, ajak temen kamu download aplikasi fore",
      "image": "assets/image/comet.jpg",
    },
    {
      "promo": "Fore Gift",
      "deskripsi": "Rayakan setiap momen",
      "image": "assets/image/comet.jpg",
    },
  ];

  Future<List<ModelPromo>> getPromo() async {
    List<ModelPromo> result = body2.map((e) => ModelPromo.fromJson(e)).toList();
    return result;
  }

  final List<Map<String, dynamic>> body3 = [
    {
      "_id": "12",
      "name": "Recommended",
    },
    {
      "_id": "123",
      "name": "Buttercream Temptation",
    },
    {
      "_id": "12",
      "name": "Deli",
    },
    {
      "_id": "123",
      "name": "Others",
    },
  ];

  Future<List<ModelCategory>> getCategory() async {
    List<ModelCategory> result =
        body3.map((e) => ModelCategory.fromJson(e)).toList();
    return result;
  }
}
