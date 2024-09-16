// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graphql_flutter/data/repositories/all_flims_repository/all_films_repository.dart';

import '../../../data/models/all_films_model/all_films_model.dart';

class AllFilmsUsecases {
  final AllFilmsRepository _allFilmsRepository;
  AllFilmsUsecases(
    this._allFilmsRepository,
  );

  Future<AllFilmsModel> call() async {
    return await _allFilmsRepository.getAllFilms();
  }
}
