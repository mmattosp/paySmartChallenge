import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:teste/app/shared/models/genres_model.dart';
import 'package:teste/app/shared/models/movie_model.dart';
import 'package:teste/app/shared/repositories/interfaces/movie_repository_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {  
  final IMovieRepository movieRepository;

  _HomeControllerBase(this.movieRepository);

  @observable
  List<MovieModel> movies = <MovieModel>[];

  @observable
  List<GenresModel> genres = <GenresModel>[];

  @observable
  String error;

  @observable
  bool loading = false;

  @observable
  bool isFetchingMore = false;

  @observable
  int page = 1;

  @action
  Future<void> fetchAll() async {
    try {
      loading = true;

      final fetchedItens = await movieRepository.fetchAll(page);
      final newList = [...movies, ...fetchedItens];
      
      for (int i=0; i<newList.length-1; i++){
        for (int j=0; j<newList[i].genresId.length-1; j++){
          newList[i].genres.add(genres.firstWhere((e) => e.id == newList[i].genresId[j], orElse: null));
        } 
      }
      
      movies.clear();
      movies = newList;
      page++;
    } on DioError catch (dioError) {
      error = 'Ocorreu um erro ao buscar.';
      print("error: ${dioError.response.data}");
    } on Exception catch (e) {
      print("BRUTAL ERROR : ${e.toString()}");
    } finally {
      loading = false;
    }
  }

  @action
  List<GenresModel> getGen(MovieModel movie){
    List<GenresModel> genresList = [];
    
    for (int j=0; j<genres.length-1; j++){
      for (int i=0; i<movie.genresId.length-1; i++){
        if (movie.genresId[i] == genres[j].id){
          print('>>>>>>>');
          genresList.add(genres[j]);
        }
      }
    }

    print('>>>>>>>>>>>>>> $genresList');

    return genresList;
  }

  @action
  Future<void> fetchGenres() async{
    try {
      genres = await movieRepository.fetchGenres();
    } on DioError catch (dioError) {
      error = 'Ocorreu um erro ao buscar.';
      print("error: ${dioError.response.data}");
    } on Exception catch (e) {
      print("BRUTAL ERROR : ${e.toString()}");
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> movieSearch(String _search) async {
    try {
      List<MovieModel> movieSearch = [];
      if(_search != ''){
        movies.forEach((e) {
          if(e.title.contains(_search)){
            movieSearch.add(e);
          }
        });
        movies = movieSearch;
      }else
      {
        movies.clear();
        page = 1;
        fetchAll();
      }
    } catch (e) {
      error = 'Ocorreu um erro ao buscar experiência.';
      print(e);
    }
  }
}
