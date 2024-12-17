import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieTitleAndReleaseDate extends StatelessWidget {
  final Movie movie;

  const MovieTitleAndReleaseDate({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Release Date: ${movie.releaseDate}",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
