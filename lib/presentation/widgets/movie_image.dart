import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieImage extends StatelessWidget {
  final Movie movie;

  const MovieImage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      height: 500,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
