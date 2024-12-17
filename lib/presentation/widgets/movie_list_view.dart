import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/presentation/screens/movie_detail_screen.dart';

class MovieListView extends StatelessWidget {
  final ScrollController scrollController;
  final String language;

  const MovieListView({
    super.key,
    required this.scrollController,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, List<Movie>>(
      builder: (context, movies) {
        if (movies.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          controller: scrollController,
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index == movies.length) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final movie = movies[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Imagen de la película
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            Constants.requestImage(movie.posterPath),
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Información de la película
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                movie.overview,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
