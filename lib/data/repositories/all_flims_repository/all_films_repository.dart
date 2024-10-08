// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/data/services/graphql_service.dart';

import '../../models/all_films_model/all_films_model.dart';

class AllFilmsRepository {
  final GraphqlService _graphqlService;
  AllFilmsRepository(
    this._graphqlService,
  );

  Future<AllFilmsModel> getAllFilms() async {
    const String query = """
query Query {
  allFilms {
    films {
      title
      director
      releaseDate
      speciesConnection {
        species {
          name
          classification
          homeworld {
            name
          }
        }
      }
    }
  }
}
""";

    try {
      final response = await _graphqlService.query(query);
      if (kDebugMode) {
        print('response from repository =====$response');
      }

      return AllFilmsModel.fromJson(response);
    } catch (e) {
      throw Exception("Error fetching all Films: $e");
    }
  }
}
