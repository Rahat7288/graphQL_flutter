// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import 'package:graphql_flutter/core/urls/app_urls.dart';

class GraphqlService {
  final Dio _dio;
  GraphqlService(
    this._dio,
  );
  final String _url = AppUrls.baseUrl;

  /// for query through graphql============
  Future<dynamic> query(String query, {Map<String, dynamic>? variables}) async {
    final data = {
      'query': query,
      'variables': variables ?? {},
    };
    try {
      final response = await _dio.post(
        _url,
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data['data'] as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  /// mutate data using graphql============
  Future<dynamic> mutate(String mutation,
      {Map<String, dynamic>? variables}) async {
    try {
      final data = {
        'query': mutation,
        'variables': variables ?? {},
      };

      final response = await _dio.post(
        _url,
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data['data'] as Map<String, dynamic>;
      } else {
        throw Exception('Failed to mutate data');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.toString()}');
    }
  }
}
