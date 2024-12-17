import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieOverview extends StatelessWidget {
  final Movie movie;

  const MovieOverview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Text(
      movie.overview,
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.justify,
    );
  }
}
