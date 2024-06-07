import 'package:poc_provider/core/entities/movie_entity.dart';

sealed class MovieState {}

final class MovieInitState extends MovieState {}

final class MovieLoadingState extends MovieState {}

final class MovieGetState extends MovieState {
  final List<MovieEntity> movies;

  MovieGetState({required this.movies});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MovieGetState && runtimeType == other.runtimeType && movies == other.movies;

  @override
  int get hashCode => movies.hashCode;
}

final class MovieErrorState extends MovieState {
  final String error;

  MovieErrorState({required this.error});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MovieErrorState && runtimeType == other.runtimeType && error == other.error;

  @override
  int get hashCode => error.hashCode;
}
