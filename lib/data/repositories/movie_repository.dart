import 'package:the_movies/data/models/movie_result.dart';

abstract class MovieRepository {
  Future<List<MovieResult>> getMovies({required int page});
}