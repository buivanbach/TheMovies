

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie_result.dart';
import '../home_page_constant.dart';

class HomeCardWidget extends StatelessWidget {
  final MovieResult movieResult;
  const HomeCardWidget({super.key, required this.movieResult});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final date = DateTime.parse(movieResult.releaseDate.toString());
    final year = date.year;

    return Container(
      decoration: BoxDecoration(
        borderRadius: HomePageConstant.borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: HomePageConstant.spreadRadius,
            blurRadius: HomePageConstant.blurRadius,
            offset: HomePageConstant.offset, // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: HomePageConstant.borderRadius,
            child: Image.network(
              '${HomePageConstant.urlImage}${movieResult.backdropPath}',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          _contentCard(year, size),
          _rankCard(),
        ],
      ),
    );
  }

  Widget _rankCard() {
    return Positioned(
      right: HomePageConstant.kPositionedRight,
      top: HomePageConstant.kPositionedTop,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: HomePageConstant.gradient,
        ),
        child: CircleAvatar(
          radius: HomePageConstant.kSize15, // Im
          backgroundColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movieResult.voteAverage.toString().split('.').first,
                style: const TextStyle(fontSize: HomePageConstant.kSize18),
              ),
              const Text('.'),
              Text(movieResult.voteAverage.toString().split('.').last,
                  style: const TextStyle(fontSize: HomePageConstant.kSize12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentCard(int year, Size size) {
    return Positioned(
      left: HomePageConstant.kPositionedLeft,
      bottom: HomePageConstant.kPositionedBottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year.toString(),
            style: const TextStyle(
                color: Colors.white70, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: HomePageConstant.kSize5,
          ),
          SizedBox(
            width: size.width / HomePageConstant.kSize3,
            child: Text(
              movieResult.originalTitle ?? '',
              maxLines: HomePageConstant.kSize2,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
