import 'package:the_movies/data/models/movie_result.dart';
import 'package:the_movies/data/repositories/movie_repository.dart';
import 'package:the_movies/presentation/features/home_page/repositories/home_page_repository.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final MovieRepository movieRepository;

  HomePageRepositoryImpl({required  this.movieRepository});
  @override
  Future<List<MovieResult>> getMovies(int page) {
    return movieRepository.getMovies(page: page);
  }
}
