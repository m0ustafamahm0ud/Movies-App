import 'package:movie_app/movies/domain/entitry/entity.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.releaseDate,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        releaseDate: json['release_date'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids']),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
