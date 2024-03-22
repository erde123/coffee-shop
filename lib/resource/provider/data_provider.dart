// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter_coffee_application/model/category_model.dart';
import 'package:flutter_coffee_application/model/product_model.dart';
import 'package:flutter_coffee_application/model/promo_model.dart';
import 'package:flutter_coffee_application/resource/services/resources_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiServices>((ref) => ApiServices());

final promoProvider = FutureProvider<List<ModelPromo>>((ref) async {
  return ref.read(apiProvider).getPromo();
});

final categoryProvider = FutureProvider<List<ModelCategory>>((ref) async {
  return ref.read(apiProvider).getCategory();
});
