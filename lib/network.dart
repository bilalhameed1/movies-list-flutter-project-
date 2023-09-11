import 'dart:convert';

import 'package:assignment/constants.dart';
import 'package:http/http.dart' as http;

import 'models/Movie.dart';

class Network {

  Future<List<Movie>> getMovies() async {
    List<Movie> movies = List.empty(growable: true);
    final url = Uri.parse(
        '${apiUrl}movie/now_playing?language=en-US&page=1&api_key=$apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> listData = json.decode(response.body);
      // pages = listData["total_pages"];
      final results = listData["results"];
      for (final item in results) {
        movies.add(Movie(item));
      }
    }
    return movies;
  }

  Future<List<Movie>> getMoreMovies(int moviePage) async {
    List<Movie> movies = List.empty(growable: true);
    final url = Uri.parse(
        '${apiUrl}movie/now_playing?language=en-US&page=$moviePage&api_key=$apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> listData = json.decode(response.body);
      final results = listData["results"];
      for (final item in results) {
        movies.add(Movie(item));
      }
    }
    return movies;
  }

  Future<List<Movie>> getSearchMovies(String keyword) async {
    List<Movie> movies = List.empty(growable: true);
    final url = Uri.parse(
        '${apiUrl}search/movie?query=$keyword&include_adult=false&language=en-US&page=1&api_key=$apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> listData = json.decode(response.body);
      final results = listData["results"];
      for (final item in results) {
        movies.add(Movie(item));
      }
    }
    return movies;
  }
}
