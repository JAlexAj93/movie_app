import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies(int page, String language);
}
