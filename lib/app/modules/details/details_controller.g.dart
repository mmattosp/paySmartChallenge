// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$movieAtom = Atom(name: '_DetailsControllerBase.movie');

  @override
  MovieModel get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieModel value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$errorAtom = Atom(name: '_DetailsControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_DetailsControllerBase.loading');

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

  final _$fetchMovieAsyncAction =
      AsyncAction('_DetailsControllerBase.fetchMovie');

  @override
  Future<void> fetchMovie(int id) {
    return _$fetchMovieAsyncAction.run(() => super.fetchMovie(id));
  }

  @override
  String toString() {
    return '''
movie: ${movie},
error: ${error},
loading: ${loading}
    ''';
  }
}
