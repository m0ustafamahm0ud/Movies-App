import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/api_constance.dart';
import '../../../core/utils/services.dart';
import '../controller/now_playing_movies/now_playing_movies_bloc.dart';
import '../controller/now_playing_movies/now_playing_movies_event.dart';
import '../controller/now_playing_movies/now_playing_movies_state.dart';

class NowPlayingMoviesComponent extends StatelessWidget {
  const NowPlayingMoviesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<NowPlayingMoviesBloc>()..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
        builder: (BuildContext context, state) => FadeIn(
          duration: const Duration(milliseconds: 500),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.easeInOutQuart,
              height: 400.0,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {},
            ),
            items: state.nowPlayingMovies.map(
              (item) {
                return GestureDetector(
                  key: const Key('openMovieMinimalDetail'),
                  onTap: () {
                    /// TODO : NAVIGATE TO MOVIE DETAILS
                  },
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // fromLTRB
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0, 0.3, 0.5, 1],
                          ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          height: 560.0,
                          imageUrl: ApiConstance.imageUrl(item.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.redAccent,
                                    size: 16.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    'Now Playing'.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
