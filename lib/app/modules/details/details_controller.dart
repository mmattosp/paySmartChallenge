import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:teste/app/shared/models/movie_model.dart';
import 'package:teste/app/shared/repositories/interfaces/movie_repository_interface.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {  
  final IMovieRepository movieRepository;

  _DetailsControllerBase(this.movieRepository);

  @observable
  MovieModel movie;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> fetchMovie(int id) async {
    try {
      loading = true;

      movie = await movieRepository.fetchById(id);

    } on DioError catch (dioError) {
      error = 'Ocorreu um erro ao buscar.';
      print("error: ${dioError.response.data}");
    } on Exception catch (e) {
      print("BRUTAL ERROR : ${e.toString()}");
    } finally {
      loading = false;
    }
  }
}
