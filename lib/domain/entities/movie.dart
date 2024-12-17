class Movie {
  final int id;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
    required this.posterPath,
  });
}
