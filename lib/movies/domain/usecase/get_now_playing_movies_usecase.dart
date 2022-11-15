import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/movies/domain/entitry/entity.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
