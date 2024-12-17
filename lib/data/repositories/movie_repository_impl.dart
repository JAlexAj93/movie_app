import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/data/datasources/movie_api_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiDataSource apiDataSource;

  MovieRepositoryImpl({required this.apiDataSource});

  @override
  Future<List<Movie>> getPopularMovies(int page, String language) async {
    try {
      // Obtenemos la lista de MovieModel desde el API a través del data source
      final movieModels =
          await apiDataSource.fetchPopularMovies(page, language);

      // Convertimos los MovieModel a Movie (Entidad)
      return movieModels.map((movieModel) {
        return Movie(
          id: movieModel.id,
          title: movieModel.title,
          overview: movieModel.overview,
          voteAverage: movieModel.voteAverage,
          releaseDate: movieModel.releaseDate,
          genreIds: movieModel.genreIds,
          posterPath: movieModel.posterPath,
        );
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener las películas populares: $e');
    }
  }
}
