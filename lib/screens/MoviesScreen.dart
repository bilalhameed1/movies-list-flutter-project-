import 'package:assignment/controller.dart';
import 'package:assignment/widgets/movies_grid_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TMDB',
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                controller.fetchMovies();
                controller.nameSearchController.text = "";
                controller.scrollController.jumpTo(0.0);
              },
              child: const Text("Home"))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(label: Text("Enter Movie Name")),
                    controller: controller.nameSearchController,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller
                          .searchMovies(controller.nameSearchController.text);
                      controller.scrollController.jumpTo(0.0);
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
          SizedBox(
            width : size.width - 10,
            height: size.height - 200,
            child: Obx(
              () => GridView.builder(
                //controller: controller.scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (size.width > 600) ? 6 : 3,
                    childAspectRatio: 150 / 280,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.movies.length,
                itemBuilder: (context, index) {
                  if (index + 5 == controller.movies.length) {
                    controller.fetchMoreMovies();
                  }
                  return MoviesGridList(
                    movie: controller.movies[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
