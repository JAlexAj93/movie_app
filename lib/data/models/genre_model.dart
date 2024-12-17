import 'package:movie_app/domain/entities/genre.dart';

class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  // Método para convertir de JSON a GenreModel
  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }

  // Método para convertir GenreModel a un objeto de dominio Genre
  Genre toDomain() {
    return Genre(
      id: id,
      name: name,
    );
  }
}
