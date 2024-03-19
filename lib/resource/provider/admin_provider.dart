import 'package:flutter_coffee_application/model/order_model.dart';
import 'package:flutter_coffee_application/model/user_model.dart';
import 'package:flutter_coffee_application/resource/services/admin_services.dart';
import 'package:flutter_coffee_application/resource/services/profile_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminServices = Provider<AdminServices>((ref) => AdminServices());
final todayOrderProvider = FutureProvider<List<ModelOrder>>((ref) async {
  return ref.read(adminServices).getTodayOrder();
});
final allOrderProvider = FutureProvider<List<ModelOrder>>((ref) async {
  return ref.read(adminServices).getAllOrder();
});