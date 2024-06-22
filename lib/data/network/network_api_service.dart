import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/exception/app_exception.dart';
import 'package:movie_app/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseAPiServices {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        return response;
      }
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException("");
    }
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    try {
      final response = await http
          .post(
            Uri.parse(url),
            // indicate that the requested body is in json format
            headers: {"Content-Type": "application/json"},
            // encodes the data into json format
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        // returns the decoded json response
        return jsonDecode(response.body);
      }
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException("");
    }
  }
}
