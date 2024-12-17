import 'package:movie_app/data/datasources/genre_api_data_source.dart';
import 'package:movie_app/data/repositories/genre_repository_impl.dart';
import 'package:movie_app/data/datasources/movie_api_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/core/network/api_client.dart';
import 'package:movie_app/domain/usecases/fetch_popular_movies.dart';
import 'package:movie_app/domain/usecases/fetch_genres.dart';
import 'package:http/http.dart' as http;

class AppInjector {
  static ApiClient apiClient = ApiClient(client: http.Client());

  // Métodos para obtener las instancias de los repositorios y usecases
  static MovieRepositoryImpl getMovieRepository() {
    return MovieRepositoryImpl(
      apiDataSource: MovieApiDataSource(apiClient),
    );
  }

  static GenreRepositoryImpl getGenreRepository() {
    return GenreRepositoryImpl(
      genreApiDataSource: GenreApiDataSource(apiClient),
    );
  }

  static FetchPopularMovies getFetchPopularMovies() {
    return FetchPopularMovies(getMovieRepository());
  }

  static FetchGenres getFetchGenres() {
    return FetchGenres(getGenreRepository());
  }
}
