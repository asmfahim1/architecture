import 'dart:convert';

import 'package:architecture_getx/core/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constant_key.dart';

class ApiClient extends GetConnect implements GetxService {
  String? token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late SharedPreferences sharedPreferences;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;

    timeout = const Duration(seconds: 20);
    token = sharedPreferences.getString(AppConstantKey.TOKEN.key) ?? '';
    _mainHeaders = {
      'Context-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  String _buildUrl(String partialUrl) {
    final baseUrl = AppConstants.baseUrl;
    return baseUrl + partialUrl;
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Context-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      final completeUrl = _buildUrl(uri);
      Response response = await get(
          Uri.encodeFull('https://jsonplaceholder.typicode.com/comments'),
          headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      final completeUrl = _buildUrl(uri);
      Response response =
          await post(completeUrl, jsonEncode(body), headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(String uri, dynamic body) async {
    try {
      final completeUrl = _buildUrl(uri);
      Response response =
          await put(uri, jsonEncode(completeUrl), headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> patchData(String uri, dynamic body) async {
    try {
      final completeUrl = _buildUrl(uri);
      Response response =
          await patch(completeUrl, jsonEncode(body), headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
