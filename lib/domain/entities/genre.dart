class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  // Método para convertir de JSON a Genre
  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
