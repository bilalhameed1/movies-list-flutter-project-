import 'package:flutter/foundation.dart';

class Movie {
  const Movie._internal(
      {required this.title,
      required this.year,
      required this.posterPath,
      required this.backdropPath,
      required this.voteAverage,
      required this.voteCount,
      required this.overview});

  final String title;
  final String? year;
  final String? posterPath;
  final String? backdropPath;
  final String voteAverage;
  final int voteCount;
  final String overview;

  factory Movie(final item) {
    return Movie._internal(
        title: item['title'],
        year: item['release_date'],
        posterPath: item['poster_path'],
        backdropPath: item["backdrop_path"],
        voteAverage: item['vote_average'].toString(),
        voteCount: item['vote_count'],
        overview: item['overview']);
  }
}
