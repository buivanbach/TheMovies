import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies/di/injection/injection.dart';
import 'package:the_movies/presentation/features/home_page/bloc/home_page_bloc.dart';
import 'package:the_movies/presentation/features/home_page/repositories/home_page_repository.dart';

import 'configurations/routes.dart/app_router.dart';
import 'presentation/features/home_page/home_page_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      title: 'GoRouter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade200),
    );
  }
}
