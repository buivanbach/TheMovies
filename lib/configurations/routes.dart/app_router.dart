import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies/di/injection/injection.dart';
import 'package:the_movies/presentation/features/detail_movie/detail_movie_screen.dart';
import 'package:the_movies/presentation/features/home_page/bloc/home_page_bloc.dart';
import 'package:the_movies/presentation/features/home_page/home_page_screen.dart';

import 'app_routes_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: PAGES.homepage.screenPath,
        name: PAGES.homepage.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomePageBloc>(),
          child: const HomePageScreen(),
        ),
      ),
      GoRoute(
        path: PAGES.detailmovie.screenPath,
        name: PAGES.detailmovie.screenName,
        builder: (context, state) => const DetailMovieScreen(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
