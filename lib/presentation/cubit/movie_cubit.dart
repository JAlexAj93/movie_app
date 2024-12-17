import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/fetch_popular_movies.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieCubit extends Cubit<List<Movie>> {
  final FetchPopularMovies fetchPopularMovies;

  bool _isLoading = false;
  int _currentPage = 1;

  MovieCubit(this.fetchPopularMovies) : super([]);

  void loadMovies(int page, String language) async {
    if (_isLoading) return; // Si ya estamos cargando, no hacer nada
    _isLoading = true;

    try {
      print("Loading movies page $page...");
      final movies = await fetchPopularMovies.execute(page, language);
      if (page == 1) {
        // Si es la primera página, reiniciamos la lista
        emit(movies);
      } else {
        // Si no es la primera página, agregamos las nuevas películas
        emit(List.from(state)..addAll(movies));
      }
      _currentPage = page; // Actualizamos la página actual
      print("Movies loaded: ${movies.length}");
    } catch (e) {
      print("Error: $e");
      // Si ocurre un error, emitimos la lista actual
      emit(state);
    } finally {
      _isLoading = false; // Rehabilitamos la carga
    }
  }

  void loadMoreMovies(String language) {
    loadMovies(_currentPage + 1, language);
  }
}
