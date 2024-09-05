import 'dart:convert';
//import 'package:draggable/MODEL/user_model.dart';
import 'package:draggable/MODEL/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class ApiServices {
  String endpoint = 'https://digitaldreamsng.com/assets/movies.json';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());
