import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/genre.dart';
import 'package:movie_app/domain/usecases/fetch_genres.dart';

class GenreState {
  final List<Genre> genres;
  GenreState({required this.genres});
}

class GenreCubit extends Cubit<GenreState> {
  final FetchGenres fetchGenres;

  GenreCubit(this.fetchGenres) : super(GenreState(genres: []));

  Future<void> loadGenres(String language) async {
    try {
      final genres = await fetchGenres.execute(language);
      print(
          "Genres loaded: $genres"); // Verifica que los géneros se carguen correctamente
      emit(GenreState(genres: genres));
    } catch (e) {
      print("Error loading genres: $e");
      emit(GenreState(genres: [])); // Maneja el error si es necesario
    }
  }
}
