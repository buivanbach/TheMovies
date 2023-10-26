import 'dart:convert';

import 'package:the_movies/data/models/movie_result.dart';
import 'package:the_movies/data/repositories/movie_repository.dart';

import '../../datasource/remote/api_movie.dart';

class MovieRepositoryImpl extends MovieRepository {
  final ApiMovie apiMovie;

  MovieRepositoryImpl({required this.apiMovie});

  @override
  Future<List<MovieResult>> getMovies({required int page}) async {
    final response = await apiMovie.getMovies(page);
  
    final List<MovieResult> moviesList = response.results
        .map((e) => MovieResult.fromJson(jsonDecode(jsonEncode(e))))
        .toList();
    return moviesList;
  }
}
