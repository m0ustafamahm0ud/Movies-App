import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';

import 'package:movie_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';

import 'package:movie_app/movies/presentation/controller/popular_movies/popular_movies_event.dart';
import 'package:movie_app/movies/presentation/controller/popular_movies/popular_movies_state.dart';
import 'package:movie_app/movies/presentation/controller/top_rated_movies/top_rated_movies_event.dart';
import 'package:movie_app/movies/presentation/controller/top_rated_movies/top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  TopRatedMoviesBloc(this.getTopRatedMoviesUseCase)
      : super(const TopRatedMoviesState()) {
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.call();
      // print(result);
      result.fold(
        (l) => emit(TopRatedMoviesState(message: l.message)),
        (r) => emit(
          TopRatedMoviesState(
            message: 'success',
            topRatedMovies: r,
            requestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
