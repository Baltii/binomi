// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_brace_in_string_interps, deprecated_member_use

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:binomi/shared/models/User.dart';

import 'package:dio/dio.dart';

class ApiClient {
  static const String URL = 'http://10.0.2.2:3000/';
  final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> registerUser(
      Map<String, dynamic>? userData) async {
    try {
      // Make POST request to the registration endpoint
      Response response = await _dio.post(
        '${URL}auth/signup',
        data: userData,
      );

      // Return response data along with status code
      return {
        'statusCode': response.statusCode,
        'data': response.data,
      };
    } on DioError catch (e) {
      // Handle Dio errors
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx.
        return {
          'statusCode': e.response!.statusCode,
          'error': 'Server error',
          'message': e.response!.statusMessage,
        };
      } else {
        // The request was made but no response was received, or
        // something went wrong during processing the response.
        return {
          'error': 'Network error',
          'message': e.message,
        };
      }
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

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
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
