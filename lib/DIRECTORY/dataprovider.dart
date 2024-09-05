import 'package:draggable/MODEL/user_model.dart';
import 'package:draggable/SERVICES/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final UserDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
