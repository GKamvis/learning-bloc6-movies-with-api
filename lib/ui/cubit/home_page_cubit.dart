import 'package:myapp/data/entity/movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/repo/movies_dao.dart';

class HomePageCubit extends Cubit<List<Movies>> {
  HomePageCubit() : super([]);

  var MRepo = MoviesRepository();

  Future<void> addMovies() async {
    var list = await MRepo.GetMovies();
    emit(list);
  }
}
