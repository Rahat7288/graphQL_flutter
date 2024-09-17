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

          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(title: Text('title default'));
            },
          );
        }));
  }
}
