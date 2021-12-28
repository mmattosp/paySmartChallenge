import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/shared/models/genres_model.dart';
import 'package:teste/app/shared/models/movie_model.dart';

abstract class IMovieRepository implements Disposable {
  Future<List<MovieModel>> fetchAll(int page);
  Future<MovieModel> fetchById(int id);
  Future<List<GenresModel>> fetchGenres();
}
