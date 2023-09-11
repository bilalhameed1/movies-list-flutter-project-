import 'package:assignment/constants.dart';
import 'package:assignment/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailsPortrait extends StatelessWidget {
  const MovieDetailsPortrait({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String imagePath = "$imagePathUrl${movie.backdropPath}";
    if (movie.backdropPath == null) {
      imagePath = "$imagePathUrl${movie.posterPath}";
    }

    Widget portraitImage = Image.network(
      imagePath,
      width: double.infinity,
      height: size.height / 2.4,
      fit: BoxFit.cover,
    );
    if (movie.backdropPath == null && movie.posterPath == null) {
      portraitImage = Image.asset(
        noImage,
        width: double.infinity,
        height: size.height / 2.4,
        fit: BoxFit.cover,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        portraitImage,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              const Text("Release Date:  ", style: TextStyle(fontSize: 19)),
              Text(
                movie.year!,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            "Overview",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Text(
            movie.overview,
            style: const TextStyle(fontSize: 17),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Text("Vote Count: ", style: TextStyle(fontSize: 18)),
                  Text(
                    movie.voteCount.toString(),
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                children: [
                  const Text("Vote Average: ", style: TextStyle(fontSize: 18)),
                  Text(movie.voteAverage.toString(),
                      style: const TextStyle(fontSize: 18))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
