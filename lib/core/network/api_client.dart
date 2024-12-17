import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movie_app/core/errors/exceptions.dart';

class ApiClient {
  final http.Client client;

  ApiClient({
    required this.client,
  });

  // Método para hacer una petición GET
  Future<http.Response> get(String url, String token) async {
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // Devolvemos la respuesta completa (http.Response) para que podamos acceder a statusCode
      return response;
    } catch (e) {
      throw ServerException('Failed to load data: $e');
    }
  }

  // Verifica si hay conexión a Internet
  Future<bool> get isConnected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    return connectivityResult != ConnectivityResult.none;
  }
}
