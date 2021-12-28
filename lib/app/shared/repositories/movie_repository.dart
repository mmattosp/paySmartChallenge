import 'package:teste/app/shared/models/genres_model.dart';
import 'package:teste/app/shared/models/movie_model.dart';

import '../helpers/custom_dio.dart';
import 'interfaces/movie_repository_interface.dart';

class MovieRepository implements IMovieRepository {
  final CustomDio customDio;
  const MovieRepository(this.customDio);

  Future<List<MovieModel>> fetchAll(int page) async {
    final response = await customDio.get('/movie/popular?page=$page');
    return (response.data['results'] as List)
        .map((json) => MovieModel.fromJson(json))
        .toList();
  }

  Future<MovieModel> fetchById(int id) async {
    final response = await customDio.get('/movie/$id');
    return MovieModel.fromJson(response.data);
  }

  Future<List<GenresModel>> fetchGenres() async{
    final response = await customDio.get('/genre/movie/list?');
    return (response.data['genres'] as List)
        .map((json) => GenresModel.fromJson(json))
        .toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
