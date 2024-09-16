import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/data/repositories/all_flims_repository/all_films_repository.dart';
import 'package:graphql_flutter/domain/usecases/all_films_usecases/all_films_usecases.dart';
import 'package:graphql_flutter/presentation/controllers/all_films_controller/all_films_controller.dart';

import '../../../data/services/graphql_service.dart';

class AllFlimsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<GraphqlService>(() => GraphqlService(Get.find()));
    Get.lazyPut<AllFilmsRepository>(() => AllFilmsRepository(Get.find()));
    Get.lazyPut<AllFilmsUsecases>(() => AllFilmsUsecases(Get.find()));
    Get.lazyPut<AllFilmsController>(() => AllFilmsController(Get.find()));
  }
}
