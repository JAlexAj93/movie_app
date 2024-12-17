import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/network/api_client.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/data/models/genre_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenreApiDataSource {
  final ApiClient apiClient;

  GenreApiDataSource(this.apiClient);

  // Método para obtener los géneros desde la API
  Future<List<GenreModel>> fetchGenres(String language) async {
    final url = Constants.baseUrl() + Constants.genresDescription(language);

    if (await apiClient.isConnected) {
      final response = await apiClient.get(url, Constants.token());

      // Procesamos la respuesta
      return _handleResponse(response);
    } else {
      throw ConnectionException('Failed Connection');
    }
  }

  List<GenreModel> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Si la respuesta es exitosa convertimos en un modelo de GenreModel
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> genreList = data['genres'];

      return genreList
          .map((genreJson) => GenreModel.fromJson(genreJson))
          .toList();
    } else {
      throw Exception('Error al cargar las películas: ${response.statusCode}');
    }
  }
}
