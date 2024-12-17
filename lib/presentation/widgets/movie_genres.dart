import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/genre.dart';
import 'package:movie_app/presentation/cubit/genre_cubit.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieGenres extends StatelessWidget {
  final Movie movie;

  const MovieGenres({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, genreState) {
        // Si no se ha cargado la lista de géneros, mostramos un cargando
        if (genreState.genres.isEmpty) {
          return const CircularProgressIndicator();
        }

        // Mapear los genreIds a los nombres de los géneros
        List<String> genreNames = movie.genreIds.map((genreId) {
          final genre = genreState.genres.firstWhere(
            (genre) => genre.id == genreId,
            orElse: () => Genre(id: -1, name: 'Unknown'),
          );
          return genre.name;
        }).toList();

        return Text(
          "Genres: ${genreNames.join(', ')}",
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        );
      },
    );
  }
}
