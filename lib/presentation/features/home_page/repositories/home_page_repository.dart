import 'package:the_movies/data/models/movie_result.dart';

abstract class HomePageRepository {
  Future<List<MovieResult>> getMovies(int page);
}
