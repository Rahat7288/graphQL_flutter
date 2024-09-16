import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:graphql_flutter/presentation/controllers/all_films_controller/all_films_controller.dart';

import 'presentation/bindings/all_flims_binding/all_flims_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AllFlimsBinding(),
      home: const MyHomePage(title: 'GraphQL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AllFilmsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Obx(() {
          if (controller.loading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount:
                controller.allFilmsList.value.data!.allFilms!.films!.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(controller.allFilmsList.value.data!.allFilms!
                          .films![index].title ??
                      'title'));
            },
          );
        }));
  }
}
