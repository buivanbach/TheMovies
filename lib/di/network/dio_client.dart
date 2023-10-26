import 'package:dio/dio.dart';
import 'package:the_movies/configurations/configurations.dart';

class DioClient {
  static Dio get dio {
    final options = BaseOptions(
      responseType: ResponseType.json,
      baseUrl: Configurations.baseUrl,
    );
    final dio = Dio(options);
    return dio;
  }
}
