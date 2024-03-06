// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter_coffee_application/model/category_model.dart';
import 'package:flutter_coffee_application/model/menu_model.dart';
import 'package:flutter_coffee_application/model/promo_model.dart';
import 'package:flutter_coffee_application/resource/resources_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiServices>((ref) => ApiServices());

final menuProvider = FutureProvider.family<List<ModelMenu>, String>((ref, category) async {
  var data = await ref.read(apiProvider).getMenu();
  print(data);
  List<ModelMenu> filteredList = data.where((menu) => menu.category == category.toLowerCase()).toList();
  int count = data.where((menu) => menu.category == category.toLowerCase()).length;
  ref.watch(countItemProvider.notifier).update((state) => count);
  return filteredList;
});

final promoProvider = FutureProvider<List<ModelPromo>>((ref) async {
  return ref.read(apiProvider).getPromo();
});

final categoryProvider = FutureProvider<List<ModelCategory>>((ref) async {
  return ref.read(apiProvider).getCategory();
});

final countItemProvider = StateProvider<int>((ref) => 0);
