import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:ny_testing/services/api_status.dart';
import 'package:ny_testing/services/api_services.dart';

void main() {
  ApiServices _articleService = ApiServices();
  setUp(() {
    _articleService = ApiServices();
  });
  group('Status of getArticles call from the NYTimes API', () {
    test('return success status when http response is successful', () async {
      // Mock the API call to return a json response with http status 200 Ok //
      _articleService.client = MockClient((request) async {
        // Create sample response of the HTTP call //
        final jsonMap = {
          'status': 'OK',
        };
        return Response(jsonEncode(jsonMap), 200);
      });
      final response =
          await _articleService.getArticles(_articleService.client) as Success;
      if (kDebugMode) {
        print(response.runtimeType);
      }
      expect(response.code, 200);
      expect(response, isA<Success>());
    });
    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 101
      _articleService.client = MockClient((request) async {
        final jsonMap = {};
        return Response(jsonEncode(jsonMap), 101);
      });
      final  response =
          await _articleService.getArticles(_articleService.client) as Failure;
      expect(response, isA<Failure>());
      
      expect(response.errorResponse, 'Invalid Repsonse');
    });
  });
}
