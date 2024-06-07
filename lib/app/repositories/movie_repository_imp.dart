import 'dart:isolate';

import 'package:poc_provider/app/adapters/movie_adapter.dart';
import 'package:poc_provider/core/http/api.dart';
import 'package:poc_provider/core/repositories/movie_repository.dart';
import 'package:poc_provider/core/states/movie_state.dart';

final class MovieRepositoryImp implements MovieRepository {
  final Api _api;

  MovieRepositoryImp({required Api api}) : _api = api;

  @override
  Future<MovieState> getMovies() async {
    return await _getDataFromIsolate();
  }

  Future<MovieState> _getDataFromIsolate() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_fetchData, receivePort.sendPort);
    return await receivePort.first;
  }

  Future<void> _fetchData(SendPort sendPort) async {
    try {
      final result = await _api.get(
        url: 'https://api.themoviedb.org/3/movie/popular?api_key=aa6f43ace72aa5c8adde2ee268cc326c',
      ) as Map<String, dynamic>?;

      sendPort.send(MovieGetState(movies: MovieAdapter.jsonToList(json: result!)));
    } catch (e) {
      sendPort.send(MovieErrorState(error: 'Error.: $e'));
    }
  }
}
