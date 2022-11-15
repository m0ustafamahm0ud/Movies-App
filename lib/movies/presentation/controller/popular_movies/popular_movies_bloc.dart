import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';

import 'package:movie_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movies_usecase.dart';

import 'package:movie_app/movies/presentation/controller/popular_movies/popular_movies_event.dart';
import 'package:movie_app/movies/presentation/controller/popular_movies/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  PopularMoviesBloc(this.getPopularMoviesUseCase)
      : super(const PopularMoviesState()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.call();
      // print(result);
      result.fold(
        (l) => emit(PopularMoviesState(message: l.message)),
        (r) => emit(
          PopularMoviesState(
            message: 'success',
            popularMovies: r,
            requestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
