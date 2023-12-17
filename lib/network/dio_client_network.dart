import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_app_flutter/contants/http_constants.dart';

class DioClientNetwork {
  final _dio = Dio(); //builtin

  Future<Dio> _getApiClient() async {
    _dio.interceptors.clear();

    // log of api will be enabled
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: kDebugMode,
        responseBody: kDebugMode,
      ),
    );

    return _dio;
  }

  Future postRequest(String url, dynamic data) async {
    try {
      final http = await _getApiClient();
      final response = await http.post(HttpConstants.base + url, data: data);
      return response.data;
    } on SocketException {
      throw 'No Internet Connection';
    } catch (e) {
      if (e is DioError) {
        if (e.message.toString().contains('Network is unreachable')) {
          throw 'No Internet Connection';
        } else if (e.response?.statusCode == 404 ||
            e.response?.statusCode == 400 ||
            e.response?.statusCode == 401) {
          throw e.response!.data['message'] ?? 'Some error occurred';
        }
      }
      throw 'Some error occurred';
    }
  }

  Future getRequest(String url) async {
    try {
      final http = await _getApiClient();
      final response = await http.get(HttpConstants.base + url);
      return response.data;
    } on SocketException {
      throw 'No Internet Connection';
    } catch (e) {
      if (e is DioError) {
        if (e.message.toString().contains('Network is unreachable')) {
          throw 'No Internet Connection';
        } else if (e.response?.statusCode == 404 ||
            e.response?.statusCode == 400 ||
            e.response?.statusCode == 401) {
          throw e.response!.data['message'] ?? 'Some error occurred';
        }
      }
      throw 'Some error occurred';
    }
  }

  Future patchRequest(String url, Map<String, dynamic> data) async {
    try {
      final http = await _getApiClient();
      final response = await http.patch(HttpConstants.base + url, data: data);
      return response.data;
    } on SocketException {
      throw 'No Internet Connection';
    } catch (e) {
      if (e is DioError) {
        if (e.message.toString().contains('Network is unreachable')) {
          throw 'No Internet Connection';
        } else if (e.response?.statusCode == 404 ||
            e.response?.statusCode == 400 ||
            e.response?.statusCode == 401) {
          throw e.response!.data['message'] ?? 'Some error occurred';
        }
      }
      throw 'Some error occurred';
    }
  }

  Future deleteRequest(String url) async {
    try {
      final http = await _getApiClient();
      final response = await http.delete(HttpConstants.base + url);
      return response.data;
    } on SocketException {
      throw 'No Internet Connection';
    } catch (e) {
      if (e is DioError) {
        if (e.message.toString().contains('Network is unreachable')) {
          throw 'No Internet Connection';
        } else if (e.response?.statusCode == 404 ||
            e.response?.statusCode == 400 ||
            e.response?.statusCode == 401) {
          throw e.response!.data['message'] ?? 'Some error occurred';
        }
      }
      throw 'Some error occurred';
    }
  }
}
