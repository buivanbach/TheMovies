import 'package:equatable/equatable.dart';
import 'package:the_movies/data/models/movie_result.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {
  const HomePageInitial();
  List<Object> get props => [];
}

class HomePageLoadSuccess extends HomePageState {
  final List<MovieResult> movies;

  const HomePageLoadSuccess(this.movies);
  @override
  List<Object> get props => [movies];
}

class HomePageLoadFail extends HomePageState {
  final String error;

  const HomePageLoadFail(this.error);
  @override
  List<Object> get props => [error];
}

class HomePageLoading extends HomePageState {
  const HomePageLoading();
    @override
  List<Object> get props => [];
}
