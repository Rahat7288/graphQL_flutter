import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/all_films_controller/all_films_controller.dart';

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

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemCount:
                  controller.allFilmsList.value.data?.allFilms!.films!.length,
              itemBuilder: (context, index) {
                final film =
                    controller.allFilmsList.value.data?.allFilms!.films![index];
                return Card(
                  child: ListTile(
                    title: Text(film?.title ?? 'title default'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(film?.director ?? 'director'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Release Date : ${film?.releaseDate}")
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
