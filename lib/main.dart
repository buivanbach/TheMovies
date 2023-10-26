import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:the_movies/data/datasource/remote/api_movie.dart';
import 'package:the_movies/data/models/movie_result.dart';
import 'package:the_movies/data/repositories/impl/movie_repository_impl.dart';

import 'app.dart';
import 'configurations/configurations.dart';
import 'di/injection/injection.dart';
import 'utils/dotevn/dotevn.dart';

Future<void> main() async {
  await DotEnv().load(fileName: 'lib/utils/dotevn/.env');
  Dotenv dotenv = Dotenv();
  Configurations().setConfigurationValue(dotenv);
  await Injection.inject();
  runApp(const App());
}
