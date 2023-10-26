import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
  @override
  List<Object> get props => [];
}

class LoadedDataMovies extends HomePageEvent {
  final int page;

  const LoadedDataMovies({required  this.page});

  @override
  List<Object> get props => [page];
}

class LoadNextPage extends HomePageEvent {
  const LoadNextPage();
  @override
  List<Object> get props => [];
}
