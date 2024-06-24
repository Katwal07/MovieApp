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

  // This method sends a POST request to the specific URLs with the provided data.
  @override
  Future<dynamic> postApi(String url, var data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    try {
      //  Original Dart object (Map in this case)
      //   Map<String, String> data = {
      //       'email': 'user@example.com',
      //      'password': 'userpassword',
      //    };
      // Before sending a POST request with user credentials, 
      // the data needs to be encoded into JSON format
      String jsonData = jsonEncode(data);

      final response = await http
          .post(
            Uri.parse(url),
            // indicate that the requested body is in json format
            headers: {"Content-Type": "application/json"},
            body: jsonData,
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        // After receiving the response from the server, 
        // we need to decode the JSON response to work with it in your application
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      }
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException("");
    }
  }
}
