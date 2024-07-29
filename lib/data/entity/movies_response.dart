import 'package:myapp/data/entity/movies.dart';

class MoviesResponse {
  List<Movies> movies;
  int success;

  MoviesResponse({required this.movies, required this.success});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json['filmler'] as List;
    int success = json['success'] as int;

    var movie = jsonArray
        .map((jsonArrayObject) => Movies.fromJson(jsonArrayObject))
        .toList();
    print("Parsed movie: $movie");

    return MoviesResponse(movies: movie, success: success);
  }
}
