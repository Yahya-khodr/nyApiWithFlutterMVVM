import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:ny_testing/models/article_response_model.dart';
import 'package:ny_testing/repo/api_status.dart';
import 'package:ny_testing/utils/constants.dart';

class ArticleServices {
  static Future<Object> getArticles() async {
    try {
      var url = Uri.parse(ARTICLE_RESPONSE);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(response: ArticleResponse.fromJson(jsonDecode(response.body)));
      }
      return Failture(code: 100, errorResponse: 'Invalid Repsonse');
    } on HttpException {
      return Failture(code: 101, errorResponse: 'No Internet');
    } on FormatException {
      return Failture(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failture(code: 103, errorResponse: 'Unknown Error');
    }
  }
}
