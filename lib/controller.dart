import 'package:assignment/models/Movie.dart';
import 'package:assignment/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final network = Network();
  int moviesPage = 1;
  RxList<Movie> movies = RxList([]);
  List<Movie> featuredMovies = List.empty(growable: true);
  List<Movie> searchedMovies = [];
  List<Movie> newLoadedMovies = [];
  final nameSearchController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  @override
  void dispose() {
    super.dispose();
    nameSearchController.dispose();
  }

  void fetchMovies() async {
    searchedMovies.clear();
    movies.clear();
    if (featuredMovies.isEmpty) {
      featuredMovies = await network.getMovies();
      movies.addAll(featuredMovies);
    } else {
      movies.addAll(featuredMovies);
    }
  }

  void fetchMoreMovies() async {
    moviesPage++;
    newLoadedMovies.clear();
    newLoadedMovies = await network.getMoreMovies(moviesPage);
    featuredMovies.addAll(newLoadedMovies);
    movies.addAll(featuredMovies);
  }

  void searchMovies(String keyword) async {
    searchedMovies.clear();
    movies.clear();
    if (keyword == "") {
      movies.addAll(featuredMovies);
    } else {
      searchedMovies = await network.getSearchMovies(keyword);
      movies.addAll(searchedMovies);
    }
  }
}