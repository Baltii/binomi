// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:binomi/shared/models/User.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static const String URL = 'http://localhost:3000/';
  final Dio _dio = Dio();
  var cookieJar = CookieJar();

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
        '${URL}auth/signup', //ENDPONT URL
        data: userData, //REQUEST BODY
      );
      //returns the successful json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      return e.response!.data;
    }
  }

  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '${URL}auth/signin',
        data: {'email': email, 'password': password},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

  void GetToken() async {
    final cookieJar = CookieJar();
    List<Cookie> results =
        await cookieJar.loadForRequest(Uri.parse('http://localhost:3000/'));
    print(results);
  }

  Future<Response> getUserProfileData(String accesstoken) async {
    try {
      Response response = await _dio.get(
        '${URL}auth/user',
        queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${accesstoken}',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<User> getUser(String id) async {
    final response = await http.get(Uri.parse('${URL}user/${id}'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  Future<Response> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        '${URL}auth/signout',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
