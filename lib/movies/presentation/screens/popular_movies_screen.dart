import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';

import '../../../core/utils/api_constance.dart';
import '../../../core/utils/services.dart';
import '../controller/popular_movies/popular_movies_bloc.dart';
import '../controller/popular_movies/popular_movies_event.dart';
import '../controller/popular_movies/popular_movies_state.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return sl<PopularMoviesBloc>()..add(GetPopularMoviesEvent());
    }, child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (BuildContext context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return Center(
                child: CircularProgressIndicator(
              color: Colors.amber.shade700,
            ));

          case RequestState.error:
            // TODO: Handle this case.
            break;

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 30, 30, 41),
                // #1E1E29
                // appBar: AppBar(
                //   leading: IconButton(
                //     onPressed: () => Navigator.of(context).pop(),
                //     icon: Icon(
                //       Icons.arrow_back_ios_new_outlined,
                //       size: 20,
                //     ),
                //   ),
                //   backgroundColor: Colors.black.withOpacity(0.4),
                //   centerTitle: true,
                //   title: Text(category),
                // ),
                body: Stack(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.only(top: 100, bottom: 20),
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.popularMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElasticIn(
                          duration: const Duration(seconds: 4),
                          delay: Duration(milliseconds: index * 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, top: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 48, 48, 48),
                                borderRadius: BorderRadius.circular(14)),
                            // height: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    fadeInCurve: Curves.slowMiddle,
                                    fadeInDuration: const Duration(seconds: 3),
                                    height: 100,
                                    width: 70,
                                    imageUrl: ApiConstance.imageUrl(state
                                        .popularMovies[index].backdropPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                120,
                                        child: Text(
                                          state.popularMovies[index].title,
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 16,
                                          width: 34,
                                          decoration: BoxDecoration(
                                              color: Colors.red.shade500,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            state.popularMovies[index]
                                                .releaseDate
                                                .split('-')[0]
                                                .toString(),
                                            style: const TextStyle(
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade600,
                                          size: 14,
                                        ),
                                        Text(
                                          ' ' +
                                              state.popularMovies[index]
                                                  .voteAverage
                                                  .toString(),
                                          style: const TextStyle(
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: Text(
                                        state.popularMovies[index].overview,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 100,
                      color: Colors.black.withOpacity(0.65),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Spacer(),
                          Text(
                            category,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
        return const SizedBox();
      },
    ));
  }
}
