import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class FetchPopularMovies {
  final MovieRepository repository;

  FetchPopularMovies(this.repository);

  Future<List<Movie>> execute(int page, String language) async {
    try {
      // Llamada al repositorio para obtener los datos
      final movieList = await repository.getPopularMovies(page, language);

      // Retornamos directamente la lista de Movie (entidades)
      return movieList;
    } catch (e) {
      // Manejo de errores
      rethrow;
    }
  }
}
