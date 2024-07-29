import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/entity/movies.dart';
import 'package:myapp/ui/cubit/home_page_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..addMovies(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: BlocBuilder<HomePageCubit, List<Movies>>(
          builder: (context, movies) {
            if (movies.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.8,
              ),
              itemBuilder: (context, index) {
                var movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/moviespage',
                      arguments: movie,
                    ).then((_) {
                      print('returned home Page');
                    });
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network('http://kasimadalan.pe.hu/filmler_yeni/resimler/${movie.image}')
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${movie.price}'),
                              ElevatedButton(
                                onPressed: () {
                                  print("movie added to list");
                                },
                                child: const Text('add'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
