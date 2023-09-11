import 'package:assignment/models/Movie.dart';
import 'package:assignment/widgets/movie_details_landscape.dart';
import 'package:assignment/widgets/movie_details_portrait.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TMDB"),
      ),
      body: SingleChildScrollView(
        child: size.width < 600
            ? MovieDetailsPortrait(movie: movie)
            : MovieDetailsLandscape(movie: movie),
      ),
    );
  }
}
