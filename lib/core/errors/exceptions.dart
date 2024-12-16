class ServerException implements Exception {
  final String message;

  ServerException([this.message = "An unknown server error occurred"]);

  @override
  String toString() => "ServerException: $message";
}

class ConnectionException implements Exception {
  final String message;

  ConnectionException([this.message = "An unknown connection error occurred"]);

  @override
  String toString() => "ConnectionException: $message";
}
