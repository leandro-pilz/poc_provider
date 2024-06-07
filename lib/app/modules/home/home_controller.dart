import 'package:flutter/material.dart';
import 'package:poc_provider/core/repositories/movie_repository.dart';
import 'package:poc_provider/core/states/movie_state.dart';

final class HomeController extends ValueNotifier<MovieState> {
  final MovieRepository _repository;

  HomeController({required MovieRepository repository})
      : _repository = repository,
        super(MovieInitState());

  MovieState get state => value;

  void _emit({required MovieState state}) {
    value = state;
  }

  Future<void> getMovies() async {
    _emit(state: MovieLoadingState());

    final result = await _repository.getMovies();

    _emit(state: result);
  }
}
