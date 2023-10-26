import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies/data/models/movie_result.dart';
import 'package:the_movies/presentation/features/home_page/bloc/home_page_bloc.dart';
import 'package:the_movies/presentation/features/home_page/bloc/home_page_event.dart';
import 'package:the_movies/presentation/features/home_page/bloc/home_page_state.dart';
import 'package:the_movies/presentation/features/home_page/home_page_constant.dart';
import 'package:the_movies/presentation/features/home_page/widgets/home_grid_view_widget.dart';

class HomePageScreen extends StatefulWidget {
  // ignore: prefer_const_declarations
  final routes = '/';
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomePageBloc get bloc => BlocProvider.of<HomePageBloc>(context);
  List<MovieResult> _movies = [];
  final _scrollController = ScrollController();

  get onPressed => null;

  void _backToFirst() {
    bloc.page = 1;
    bloc.add(LoadedDataMovies(page: bloc.page));
  }

  void _changeToNextPage() {
    bloc.page++;

    bloc.add(const LoadNextPage());
    Future.delayed(const Duration(seconds: 1));
    bloc.add(LoadedDataMovies(page: bloc.page));
    _scrollController.jumpTo(0);
  }

  void _changeToPreviousPage() {
    if (bloc.page > 1) {
      bloc.page--;

      bloc.add(const LoadNextPage());
      Future.delayed(const Duration(seconds: 1));
      bloc.add(LoadedDataMovies(page: bloc.page));
      _scrollController.jumpTo(0);
    }
  }

  void _isReachedTheBottom() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      bloc.page++;

      bloc.add(const LoadNextPage());
      Future.delayed(const Duration(seconds: 1));
      bloc.add(LoadedDataMovies(page: bloc.page));
      _scrollController.jumpTo(0);
    }
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const LoadedDataMovies(page: 1));
    _scrollController.addListener(_isReachedTheBottom);
  }

  @override
  void dispose() {
    bloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: HomePageConstant.kPaddingAllIn,
            child: BlocConsumer<HomePageBloc, HomePageState>(
              listener: (context, state) {
                if (state is HomePageLoadSuccess) {
                  _movies = state.movies;
                }
              },
              builder: (context, state) {
                if (state is HomePageLoadSuccess) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: _changeToPreviousPage,
                              icon: const Icon(Icons.chevron_left_outlined)),
                          InkWell(
                            onDoubleTap: () => _backToFirst(),
                            child: Text(
                              'Popular list \nPage ${bloc.page}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: HomePageConstant.kSize18,
                                  color: HomePageConstant.kBlack,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          IconButton(
                              onPressed: _changeToNextPage,
                              icon: const Icon(Icons.chevron_right_outlined)),
                        ],
                      ),
                      HomeGridViewWidget(
                          movies: _movies, scrollController: _scrollController),
                    ],
                  );
                } else if (state is HomePageLoadFail) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state is HomePageLoading) {
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )),
      ),
    );
  }
}
