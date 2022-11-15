import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/base_movie_remote_datasource.dart';
import 'package:movie_app/movies/data/datasource/movies_remote_datasource_impl.dart';
import 'package:movie_app/movies/data/repository/movies_repository_impl.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:movie_app/movies/presentation/controller/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/movies/presentation/controller/top_rated_movies/top_rated_movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// BLOC
    sl.registerFactory(() => NowPlayingMoviesBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));

    /// USECASE
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    /// REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepositoryImpl(sl()));
    //// DATASOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());
  }
}
