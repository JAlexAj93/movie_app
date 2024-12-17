import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/widgets/movie_image.dart';
import 'package:movie_app/presentation/widgets/movie_title.dart';
import 'package:movie_app/presentation/widgets/movie_overview.dart';
import 'package:movie_app/presentation/widgets/movie_genres.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen de la película
                  MovieImage(movie: movie),
                  const SizedBox(height: 16),
                  // Título y fecha de lanzamiento
                  MovieTitleAndReleaseDate(movie: movie),
                  const SizedBox(height: 8),
                  // Descripción de la película (Overview)
                  MovieOverview(movie: movie),
                  const SizedBox(height: 8),
                  // Géneros de la película
                  MovieGenres(movie: movie),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
