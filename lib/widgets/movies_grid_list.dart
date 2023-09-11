import 'package:assignment/constants.dart';
import 'package:assignment/models/Movie.dart';
import 'package:assignment/screens/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGridList extends StatelessWidget {
  const MoviesGridList({super.key, required this.movie});
  final Movie movie;

  final double imageHeight = 200;
  final double imageWidth = 140;


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
      height: imageHeight,
      width: imageWidth,
    );

    if (movie.backdropPath == null && movie.posterPath == null) {
      image = Image.asset(
        noImage,
        height: imageHeight,
        width: imageWidth,
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
                  height: imageHeight,
                  width: imageWidth,
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
