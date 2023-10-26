import 'package:get_it/get_it.dart';
import 'package:the_movies/di/modules/repository_module.dart';

import '../modules/api_module.dart';

GetIt getIt = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await ApiModule().provides();
    await RepositoryModule().provides();
  }
}
