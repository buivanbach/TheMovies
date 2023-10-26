import 'package:the_movies/data/datasource/remote/api_movie.dart';
import 'package:the_movies/presentation/features/home_page/repositories/home_page_repository.dart';
import 'package:the_movies/presentation/features/home_page/repositories/impl/home_page_repository_impl.dart';

import '../../data/repositories/impl/movie_repository_impl.dart';
import '../../data/repositories/movie_repository.dart';
import '../injection/injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<MovieRepository>(
      () => MovieRepositoryImpl(
        apiMovie: getIt.get<ApiMovie>(),
      ),
    );
    // getIt.registerFactory<HomeRepository>(
    //   () => HomeRepositoryImpl(
    //     movieRepository: getIt.get<MovieRepository>(),
    //   ),
    // );
    getIt.registerFactory<HomePageRepository>(() =>
        HomePageRepositoryImpl(movieRepository: getIt.get<MovieRepository>()));
  }
}
