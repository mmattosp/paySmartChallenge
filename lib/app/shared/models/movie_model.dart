import 'genres_model.dart';

class MovieModel {
  int id;
  List<GenresModel> genres;
  String overview;
  String posterPath;
  String backdropPath;
  String releaseDate;
  String title;
  List<int> genresId;

  MovieModel(
      {this.genres,
      this.id,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.backdropPath,
      this.genresId
      });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        posterPath = (json['poster_path']),
        backdropPath = (json['backdrop_path']),
        overview = json['overview'],
        releaseDate = json['release_date'],
        title = json['title'],
        genres = json['genres'] == null
            ? []
            : (json['genres'] as List)
                .map((json) => GenresModel.fromJson(json))
                .toList(),
        genresId = json['genre_ids'] == null
            ? []
            : json["genre_ids"].cast<int>();
}


