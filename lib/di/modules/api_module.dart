import 'package:the_movies/data/datasource/remote/api_movie.dart';
import 'package:the_movies/di/injection/injection.dart';
import 'package:the_movies/di/network/dio_client.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = DioClient.dio;
    getIt.registerSingleton(dio);
    getIt.registerSingleton(ApiMovie(dio, baseUrl: dio.options.baseUrl));
  }
}
