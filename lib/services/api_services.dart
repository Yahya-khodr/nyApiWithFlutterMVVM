import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

import 'package:ny_testing/models/article_response_model.dart';
import 'package:ny_testing/services/api_status.dart';
import 'package:ny_testing/utils/constants.dart';

class ApiServices {
   Client client = Client();
    Future<Object> getArticles(http.Client http) async {
    try {
      var url = Uri.parse(ARTICLE_RESPONSE);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
            response: ArticleResponse.fromJson(jsonDecode(response.body)),code: 200);
      }
      return Failure(code: 100, errorResponse: 'Invalid Repsonse');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 103, errorResponse: 'Unknown Error');
    }
  }
}
