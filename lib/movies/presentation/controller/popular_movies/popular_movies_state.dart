import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';

class PopularMoviesState extends Equatable {
  final List<Movie> popularMovies;
  final String message;
  final RequestState requestState;

  // ignore: empty_constructor_bodies
  const PopularMoviesState({
    this.popularMovies = const [],
    this.message = '',
    this.requestState = RequestState.loading,
  });

  @override
  List<Object?> get props => [
        popularMovies,
        message,
        requestState,
      ];
}
