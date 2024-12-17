import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/network/api_client.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/data/models/movie_model.dart'; // Modelo para los datos de la película

class MovieApiDataSource {
  final ApiClient apiClient;

  MovieApiDataSource(this.apiClient);

  // Método para obtener las películas populares
  Future<List<MovieModel>> fetchPopularMovies(int page, String language) async {
    final url = Constants.baseUrl() + Constants.popularMovies(page, language);

    // Verificamos si hay conexión a Internet
    if (await apiClient.isConnected) {
      final response = await apiClient.get(url, Constants.token());

      // Procesamos la respuesta
      return _handleResponse(response);
    } else {
      throw ConnectionException('Failed Connection');
    }
  }

  // Manejo de la respuesta
  List<MovieModel> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Si la respuesta es exitosa convertimos en un modelo de MovieModel
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      return results
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();
    } else {
      throw Exception('Error al cargar las películas: ${response.statusCode}');
    }
  }
}
