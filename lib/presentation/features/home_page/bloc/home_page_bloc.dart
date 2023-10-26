import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies/presentation/features/home_page/bloc/home_page_state.dart';
import 'package:the_movies/presentation/features/home_page/repositories/home_page_repository.dart';

import 'home_page_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageRepository homePageRepository;
  int page = 1;
  HomePageBloc(this.homePageRepository) : super(HomePageInitial()) {
    on<LoadedDataMovies>(_onLoadedDataMovies);
    on<LoadNextPage>(_onLoadNextPage);
  }

  FutureOr<void> _onLoadedDataMovies(
      LoadedDataMovies event, Emitter<HomePageState> emit) async {
    try {
      final movies = await homePageRepository.getMovies(event.page);
      emit(HomePageLoadSuccess(movies));
    } catch (e) {
      emit(HomePageLoadFail(e.toString()));
    }
  }

  FutureOr<void> _onLoadNextPage(
      LoadNextPage event, Emitter<HomePageState> emit) {
    emit(const HomePageLoading());
  }
}
