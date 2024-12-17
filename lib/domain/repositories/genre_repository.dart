import 'package:movie_app/domain/entities/genre.dart';

abstract class GenreRepository {
  Future<List<Genre>> fetchGenres(String language);
}
