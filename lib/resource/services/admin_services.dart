import 'dart:async';

import 'package:flutter_coffee_application/model/category_model.dart';
import 'package:flutter_coffee_application/model/product_model.dart';
import 'package:flutter_coffee_application/model/order_model.dart';
import 'package:flutter_coffee_application/model/promo_model.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_coffee_application/model/cart_model.dart';

class AdminServices {
  final List<Map<String, dynamic>> body = [
    {
      "order_id": "123456",
      "customer_id": "789",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "40000",
      "items": [
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 3},
      ]
    },
    {
      "order_id": "789012",
      "customer_id": "456",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "30000",
      "items": [
        {"product_id": "1234", "quantity": 2},
        {"product_id": "1234", "quantity": 3},
        {"product_id": "1234", "quantity": 2},
      ]
    }
  ];
    final List<Map<String, dynamic>> body2 = [
    {
      "order_id": "123456",
      "customer_id": "789",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "40000",
      "items": [
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 3},
      ]
    },
    {
      "order_id": "789012",
      "customer_id": "456",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "30000",
      "items": [
        {"product_id": "1234", "quantity": 2},
        {"product_id": "1234", "quantity": 3},
        {"product_id": "1234", "quantity": 2},
      ]
    },
        {
      "order_id": "123456",
      "customer_id": "789",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "40000",
      "items": [
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 3},
      ]
    },
    {
      "order_id": "789012",
      "customer_id": "456",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "30000",
      "items": [
        {"product_id": "1234", "quantity": 2},
        {"product_id": "1234", "quantity": 3},
        {"product_id": "1234", "quantity": 2},
      ]
    },
        {
      "order_id": "123456",
      "customer_id": "789",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "40000",
      "items": [
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 1},
        {"product_id": "1234", "quantity": 3},
      ]
    },
    {
      "order_id": "789012",
      "customer_id": "456",
      "order_date": "1969-07-20 20:18:04Z",
      "total_amount": "30000",
      "items": [
        {"product_id": "1234", "quantity": 2},
        {"product_id": "1234", "quantity": 3},
        {"product_id": "1234", "quantity": 2},
      ]
    }
  ];

  Future<List<ModelOrder>> getTodayOrder() async {
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
      List<ModelOrder> result =
          body.map((e) => ModelOrder.fromJson(e)).toList();
      return result;
    } catch (e) {
      print("Error in getTodayOrder(): $e");
      rethrow;
    }
  }

  Future<List<ModelOrder>> getAllOrder() async {
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
      List<ModelOrder> result =
          body2.map((e) => ModelOrder.fromJson(e)).toList();
      return result;
    } catch (e) {
      print("Error in getTodayOrder(): $e");
      rethrow;
    }
  }
}
