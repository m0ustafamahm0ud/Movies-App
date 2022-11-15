import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/data/datasource/base_movie_remote_datasource.dart';
import 'package:movie_app/movies/data/datasource/movies_remote_datasource_impl.dart';
import 'package:movie_app/movies/data/repository/movies_repository_impl.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

import 'package:movie_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/now_playing_movies/now_playing_movies_event.dart';
import 'package:movie_app/movies/presentation/controller/now_playing_movies/now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlatingMoviesUseCase;
  NowPlayingMoviesBloc(this.getNowPlatingMoviesUseCase)
      : super(const NowPlayingMoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlatingMoviesUseCase.call();

      result.fold(
        (l) => emit(NowPlayingMoviesState(message: l.message)),
        (r) => emit(
          NowPlayingMoviesState(
            message: 'success',
            nowPlayingMovies: r,
            requestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
