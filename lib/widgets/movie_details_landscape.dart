import 'package:assignment/constants.dart';
import 'package:assignment/models/Movie.dart';
import 'package:flutter/material.dart';

class MovieDetailsLandscape extends StatelessWidget {
  const MovieDetailsLandscape({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String imagePath = "$imagePathUrl${movie.posterPath}";
    if (movie.backdropPath != null) {
      imagePath = "$imagePathUrl${movie.backdropPath}";
    }
    Widget landscapeImage = Image.network(
      imagePath,
      width: size.width / 3,
      height: 350,
      fit: BoxFit.cover,
    );
    if (movie.backdropPath == null && movie.posterPath == null) {
      landscapeImage = Image.asset(
        noImage,
        width: size.width / 3,
        height: 350,
        fit: BoxFit.cover,
      );
    }

    return Row(
      // will render when app is in landscape mode
      children: [
        landscapeImage,
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: size.width / 2,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  movie.title,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    const Text("Release Date:  ",
                        style: TextStyle(fontSize: 19)),
                    Text(
                      movie.year!,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  "Overview",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                        const Text("Vote Count: ",
                            style: TextStyle(fontSize: 18)),
                        Text(
                          movie.voteCount.toString(),
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Vote Average: ",
                            style: TextStyle(fontSize: 18)),
                        Text(movie.voteAverage.toString(),
                            style: const TextStyle(fontSize: 18))
                      ],
                    ),
                    //Text(movie.voteAverage.toString()),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
