// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$moviesAtom = Atom(name: '_HomeControllerBase.movies');

  @override
  List<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$errorAtom = Atom(name: '_HomeControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isFetchingMoreAtom = Atom(name: '_HomeControllerBase.isFetchingMore');

  @override
  bool get isFetchingMore {
    _$isFetchingMoreAtom.reportRead();
    return super.isFetchingMore;
  }

  @override
  set isFetchingMore(bool value) {
    _$isFetchingMoreAtom.reportWrite(value, super.isFetchingMore, () {
      super.isFetchingMore = value;
    });
  }

  final _$pageAtom = Atom(name: '_HomeControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$fetchAllAsyncAction = AsyncAction('_HomeControllerBase.fetchAll');

  @override
  Future<void> fetchAll() {
    return _$fetchAllAsyncAction.run(() => super.fetchAll());
  }

  final _$movieSearchAsyncAction =
      AsyncAction('_HomeControllerBase.movieSearch');

  @override
  Future<void> movieSearch(String _search) {
    return _$movieSearchAsyncAction.run(() => super.movieSearch(_search));
  }

  @override
  String toString() {
    return '''
movies: ${movies},
error: ${error},
loading: ${loading},
isFetchingMore: ${isFetchingMore},
page: ${page}
    ''';
  }
}
