// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static const String URL = 'https://localhost:3000/auth/';
  final Dio _dio = Dio();
  var cookieJar = CookieJar();

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
        '${URL}signup/', //ENDPONT URL
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
        '${URL}signin',
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
    List<Cookie> results = await cookieJar
        .loadForRequest(Uri.parse('https://localhost:3000/auth/signin'));
    print(results);
  }

  Future<Response> getUserProfileData(String accesstoken) async {
    try {
      Response response = await _dio.get(
        '${URL}user',
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

  Future<Response> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        '${URL}signout',
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
