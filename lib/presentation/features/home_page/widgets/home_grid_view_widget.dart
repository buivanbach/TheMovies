import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:the_movies/presentation/features/home_page/home_page_constant.dart';

import '../../../../data/models/movie_result.dart';
import 'home_card_widget.dart';

class HomeGridViewWidget extends StatelessWidget {
  const HomeGridViewWidget(
      {super.key, required this.movies, required this.scrollController});

  final List<MovieResult> movies;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: HomePageConstant.crossAxisCount,
          childAspectRatio: size.width /
              (size.height / HomePageConstant.ratioChildAspectRatioHeight),
          crossAxisSpacing: HomePageConstant.crossAxisCountSpacing,
          mainAxisSpacing: HomePageConstant.crossAxisCountSpacing,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final data = movies[index];
          if (index == movies.length) {
            return const CircularProgressIndicator();
          }
          return AnimationConfiguration.staggeredGrid(
            columnCount: 2,
            duration: const Duration(milliseconds: 100),
            position: index,
            child: SlideAnimation(
              child: FadeInAnimation(
                child: HomeCardWidget(movieResult: data),
              ),
            ),
          );
        },
      ),
    );
  }
}
