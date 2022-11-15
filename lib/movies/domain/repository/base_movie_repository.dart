import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';

abstract class BaseMovieRepository {
  // contract with abstract methods
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
