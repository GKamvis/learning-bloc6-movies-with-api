import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myapp/data/entity/movies.dart';
import 'package:myapp/data/entity/movies_response.dart';
import 'package:myapp/sqflite/db_helper.dart';

class MoviesRepository {
  List<Movies> parseMovie(String response) {
    return MoviesResponse.fromJson(jsonDecode(response)).movies;
  }

  Future<List<Movies>> GetMovies() async {
    var url = 'http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php';
    var response = await Dio().get(url);

    return parseMovie(response.data.toString());
  }
}
