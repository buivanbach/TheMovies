import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Dotenv {
  String get apiBaseUrl =>
      dotenv.get('API_BASE_URL', fallback: 'Cant get api base url');
}
