import 'dart:async';

import 'package:flutter_coffee_application/model/category_model.dart';
import 'package:flutter_coffee_application/model/product_model.dart';
import 'package:flutter_coffee_application/model/promo_model.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  final List<Map<String, dynamic>> body = [
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi":
          "ini air mineral yang tidak berwarna karena bening dengan tutup botol berwarna biru dan botol dengan warna transparan",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "deli",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "deli",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "deli",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "others",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "others",
    },
    {
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "others",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "others",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "recommended",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "recommended",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "recommended",
    },
    {
      "id": "1",
      "nama": "Air Mineral",
      "deskripsi": "ini air mineral",
      "harga": "10000",
      "image": "assets/image/comet.jpg",
      "category": "recommended",
    },
  ];
  Future<List<ModelProduct>> getMenu() async {
    // Map<String, String> headers = {
    //   'Id': '619c3c2e29baa215519da64d',
    //   'Secret': '360039ed-79a6-4853-8304-c7b21e166f5f',
    //   'partner': 'keuskupanSby'
    // };
    // final response = await http
    //     .get(
    //       Uri.parse('https://api.imavi.org/imavi/articles/get-all'),
    //       headers: headers,
    //     )
    //     .timeout(Duration(seconds: apiWaitTime));

    // if (response.statusCode == 200) {
    //   print(response.body);
    //   final List result = jsonDecode(response.body);
    //   return result.map(((e) => MenuModel.fromJson(e))).toList();
    // } else {
    //   throw Exception(response.reasonPhrase);
    // }
    try {
      List<ModelProduct> result = body.map((e) => ModelProduct.fromJson(e)).toList();
      return result;
    } catch (e) {
      print("Error in getNotifikasi(): $e");
      rethrow;
    }
  }

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
