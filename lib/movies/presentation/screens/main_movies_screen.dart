import 'package:flutter/material.dart';

import 'package:movie_app/movies/presentation/component/now_playing_movies_component.dart';
import 'package:movie_app/movies/presentation/component/popular_movies_component.dart';
import 'package:movie_app/movies/presentation/component/top_rated_movies_component.dart';
import 'package:movie_app/movies/presentation/screens/popular_movies_screen.dart';
import 'package:movie_app/movies/presentation/screens/top_rated_movies_screen.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingMoviesComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PopularMoviesScreen(
                                category: 'Popular Movies'),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PopularMoviesComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Rated",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopRatedMoviesScreen(
                                category: 'Top Rated Movies'),
                          ));

                      /// TODO : NAVIGATION TO Top Rated Movies Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TopRatedMoviesComponent(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
