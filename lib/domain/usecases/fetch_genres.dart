import 'package:movie_app/domain/repositories/genre_repository.dart';
import 'package:movie_app/domain/entities/genre.dart';

class FetchGenres {
  final GenreRepository repository;

  FetchGenres(this.repository);

  Future<List<Genre>> execute(String language) async {
    try {
      // Llamada al repositorio para obtener los datos
      final genreList = await repository.fetchGenres(language);

      // Retornamos directamente la lista de Movie (entidades)
      return genreList;
    } catch (e) {
      rethrow;
    }
  }
}
