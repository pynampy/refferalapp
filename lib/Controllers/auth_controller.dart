import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  bool isAuth = false;

  Future<Map<bool, String>> login(String email, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    final response = await http.post(Uri.parse("http://localhost:3000/login"),
        headers: headers,
        body: jsonEncode({
          "email": email,
          "password": password,
        }));

    if (response.statusCode != 200) {
      return {false: response.body};
    } else {
      return {true: response.body};
    }
  }

  Future<Map<bool, String>> register(
      String name, String email, String password, String refCode) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    final response =
        await http.post(Uri.parse("http://localhost:3000/register"),
            headers: headers,
            body: jsonEncode({
              "name": name,
              "email": email,
              "password": password,
              "my_ref_code": getRandomString(10),
              "ref_code": refCode
            }));

    if (response.statusCode != 200) {
      return {false: response.body};
    } else {
      return {true: response.body};
    }
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random.secure();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
