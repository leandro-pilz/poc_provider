import 'package:poc_provider/core/entities/movie_entity.dart';

class MovieAdapter {
  static List<MovieEntity> jsonToList({required Map<String, dynamic> json}) {
    return (json['results'] as List).map((e) {
      return MovieEntity(
        id: e['id'],
        title: e['title'],
        overview: e['overview'],
        releaseDate: e['release_date'],
      );
    }).toList();
  }
}
