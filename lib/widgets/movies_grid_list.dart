import 'package:assignment/constants.dart';
import 'package:assignment/models/moviesmodel.dart';
import 'package:assignment/screens/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGridList extends StatelessWidget {
  const MoviesGridList({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    Widget showYear = Text(
      movie.year!.length >= 4 ? movie.year!.substring(0, 4) : "",
      style: TextStyle(
          fontSize: 15,
          color: (year.toString() != movie.year!.substring(0, 4))
              ? Colors.white
              : Colors.red,
          fontWeight: FontWeight.bold),
    );

    String imagePath = "$imagePathUrl${movie.backdropPath}";
    if (movie.posterPath != null) {
      imagePath = "$imagePathUrl${movie.posterPath}";
    }
    Widget image = Image.network(
      imagePath,
      height: 200,
      width: 140,
    );

    if (movie.backdropPath == null && movie.posterPath == null) {
      image = Image.asset(
        noImage,
        height: 200,
        width: 140,
        fit: BoxFit.cover,
      );
    }

    return InkWell(
      onTap: () {
        Get.to(() => MovieDetails(movie: movie));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 200,
                  width: 140,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: image),
              SizedBox(
                  height: 199,
                  width: 136,
                  child: Align(alignment: Alignment.bottomRight, child: showYear))
            ],
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
