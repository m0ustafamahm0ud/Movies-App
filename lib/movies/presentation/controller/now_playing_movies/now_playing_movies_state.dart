import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';

class NowPlayingMoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String message;
  final RequestState requestState;

  // ignore: empty_constructor_bodies
  const NowPlayingMoviesState({
    this.nowPlayingMovies = const [],
    this.message = '',
    this.requestState = RequestState.loading,
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        message,
        requestState,
      ];
}
