import 'package:poc_provider/core/states/movie_state.dart';

abstract interface class MovieRepository {
  Future<MovieState> getMovies();
}
