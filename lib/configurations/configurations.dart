import 'package:the_movies/utils/dotevn/dotevn.dart';

class Configurations {
  // ignore: unused_field
  static String _baseUrl = '';
  // ignore: unused_field

  void setConfigurationValue(Dotenv dotEnv) {
    _baseUrl = Dotenv().apiBaseUrl;
  }

  static String get baseUrl => _baseUrl;
}
