import 'dart:convert';

import 'package:assignment/constants.dart';
import 'package:http/http.dart' as http;
import 'package:assignment/models/moviesmodel.dart';

class Network {

  var pages = 0;

  Future<List<Movie>> getMovies() async {
    List<Movie> movies = List.empty(growable: true);
    final url = Uri.parse(
        '${apiUrl}movie/now_playing?language=en-US&page=1&api_key=$apiKey');
    //List<Movie> movies = List.empty(growable: true);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> listData = json.decode(response.body);
      pages = listData["total_pages"];
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
    //List<Movie> movies = List.empty(growable: true);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> listData = json.decode(response.body);
      final pages = listData["total_pages"];
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


/*.then((response) async {
      final Map<String, dynamic> listData = json.decode(response.body);
      moviesPage = listData["total_pages"];
      for (int i = 1; i < mov0iesPage; i++) {
        //print(i);
        final url1 = Uri.parse(
            '${apiUrl}movie/now_playing?language=en-US&page=$i&api_key=$apiKey');
          await response = http.get(url1);


      }*/
// return movies;
// });
//return null;
//return movies;

// List<Movie> getMovies(List<Movie> getmovies){
//   final url = Uri.parse(
//       '${apiUrl}movie/now_playing?language=en-US&page=1&api_key=$apiKey');
//
//   http.get(url).then((response) {
//     final Map<String, dynamic> listData = json.decode(response.body);
//     moviesPage = listData["total_pages"];
//     for (int i = 1; i < moviesPage; i++) {
//       //print(i);
//       final url1 = Uri.parse(
//           '${apiUrl}movie/now_playing?language=en-US&page=$i&api_key=$apiKey');
//       //try {
//       http.get(url1).then((response) {
//         final Map<String, dynamic> listData = json.decode(response.body);
//         final results = listData["results"];
//         for (final item in results) {
//           getmovies.add(Movie(item));
//         }
//       });
//       // } catch (err) {
//       //   print(err);
//       // }
//     }
//   });
//   return movies;
// }
