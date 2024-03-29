import 'package:flutter_coffee_application/model/user_model.dart';
import 'package:flutter_coffee_application/resource/services/profile_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileDataProvider =
    FutureProvider.family<ModelUser, dynamic>((ref, user) async {
  // await Future.delayed(Duration(milliseconds: 500));
  // return profileExample;

  ModelUser data = await profileServices().fetchProfile();
  //   if (data.roles == "admin") {
  //   // Update isAdminProvider to true
  //   ref.read(isAdminProvider.notifier).state = true;
  // }

  return data;
});

final isAdminProvider = StateProvider<bool>((ref) => false);