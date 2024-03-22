import 'package:flutter_coffee_application/model/category_model.dart';
import 'package:flutter_coffee_application/model/product_model.dart';
import 'package:flutter_coffee_application/model/promo_model.dart';
import 'package:flutter_coffee_application/resource/services/product_services.dart';
import 'package:flutter_coffee_application/resource/services/resources_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productServices = Provider<ProductServices>((ref) => ProductServices());
final productProvider = FutureProvider.family<List<ModelProduct>, String>((ref, category) async {
  var data = await ref.read(productServices).getProduct();
  print(data);
  List<ModelProduct> filteredList = data.where((menu) => menu.category == category.toLowerCase()).toList();
  int count = data.where((menu) => menu.category == category.toLowerCase()).length;
  ref.watch(countItemProvider.notifier).update((state) => count);
  return filteredList;
});

final countItemProvider = StateProvider<int>((ref) => 0);