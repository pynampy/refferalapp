import 'dart:convert';

import 'package:get/get.dart';
import 'package:refferalapp/Models/user.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var currentUser = Rxn<User>();

  Future<void> fetchUser(email) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    final response = await http.post(Uri.parse("http://localhost:3000/user"),
        headers: headers,
        body: jsonEncode({
          "email": email,
        }));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      currentUser.value ??= User(
          email, data['name'], data['ref_code'], data['points'], data['refs'].toString());
    } else {
      print(response.statusCode);
      print(response.body);
      print("ERROR FETCHING DATA!");
    }
  }
}
