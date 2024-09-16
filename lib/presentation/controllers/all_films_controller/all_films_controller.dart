// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'package:graphql_flutter/domain/usecases/all_films_usecases/all_films_usecases.dart';

import '../../../data/models/all_films_model/all_films_model.dart';

class AllFilmsController extends GetxController {
  final AllFilmsUsecases _allFilmsUsecases;
  AllFilmsController(
    this._allFilmsUsecases,
  );

  final allFilmsList = AllFilmsModel().obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllFilms();
    super.onInit();
  }

  void fetchAllFilms() async {
    loading.value = true;
    try {
      await _allFilmsUsecases.call().then((val) {
        if (kDebugMode) {
          print('getting user value========= $val');
        }
        allFilmsList.value = val;
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading.value = false;
    }
  }
}
