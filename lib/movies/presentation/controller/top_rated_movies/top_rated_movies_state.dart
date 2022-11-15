import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';

class TopRatedMoviesState extends Equatable {
  final List<Movie> topRatedMovies;
  final String message;
  final RequestState requestState;

  // ignore: empty_constructor_bodies
  const TopRatedMoviesState({
    this.topRatedMovies = const [],
    this.message = '',
    this.requestState = RequestState.loading,
  });

  @override
  List<Object?> get props => [
        topRatedMovies,
        message,
        requestState,
      ];
}
