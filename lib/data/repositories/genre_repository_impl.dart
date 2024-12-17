import 'package:movie_app/domain/entities/genre.dart';
import 'package:movie_app/domain/repositories/genre_repository.dart';
import 'package:movie_app/data/datasources/genre_api_data_source.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreApiDataSource genreApiDataSource;

  GenreRepositoryImpl({required this.genreApiDataSource});

  @override
  Future<List<Genre>> fetchGenres(String language) async {
    // Obtenemos la lista de géneros como GenreModel desde el API
    final genreModels = await genreApiDataSource.fetchGenres(language);

    // Convertimos la lista de GenreModel a la lista de entidades Genre
    return genreModels.map((genreModel) => genreModel.toDomain()).toList();
  }
}
