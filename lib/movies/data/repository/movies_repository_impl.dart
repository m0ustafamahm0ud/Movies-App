import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/movies/data/datasource/base_movie_remote_datasource.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class MoviesRepositoryImpl extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepositoryImpl(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.message));
    }
  }
}
