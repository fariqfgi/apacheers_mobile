import 'dart:convert';

import 'package:apacheers_mobile/models/user_model.dart';
import 'package:apacheers_mobile/pages/splash_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      // SHARED PREFENCES
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', data['user']['name']);
      prefs.setString('token', 'Bearer ' + data['access_token']);

      finalName = prefs.getString('name');
      finalToken = prefs.getString('token');

      return user;
    } else {
      throw Exception("Register Failed");
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      // SHARED PREFENCES
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', data['user']['name']);
      prefs.setString('token', 'Bearer ' + data['access_token']);

      finalName = prefs.getString('name');
      finalToken = prefs.getString('token');

      return user;
    } else {
      throw Exception("Login Failed");
    }
  }
}
