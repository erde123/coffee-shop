import 'dart:async';

import 'package:flutter_coffee_application/model/category_model.dart';
import 'package:flutter_coffee_application/model/product_model.dart';
import 'package:flutter_coffee_application/model/order_model.dart';
import 'package:flutter_coffee_application/model/promo_model.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_coffee_application/model/cart_model.dart';

class ProductServices {  final List<Map<String, dynamic>> body = [
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
  Future<List<ModelProduct>> getProduct() async {
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
      print("Error in getMenu(): $e");
      rethrow;
    }
  }
}