class Constants {
  static String baseUrl() => 'https://api.themoviedb.org';
  static String requestImage(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';
  static String popularMovies(
    int page,
    String language,
  ) =>
      '/3/discover/movie?include_adult=false&include_video=false&sort_by=popularity.desc&language=$language&page=$page';
  static String genresDescription(
    String language,
  ) =>
      '/3/genre/movie/list?language=$language';
  static String token() =>
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDgxMWQ3N2M0NTg1Yzk1MDRhNjA2ZjdlMWMyMmY0YiIsIm5iZiI6MTczNDEzMzAyMi4zMjE5OTk4LCJzdWIiOiI2NzVjYzUxZTQ2NWFiNWIzZjZiMDFhMTYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.SbcfoRdaRZh1OK0JQZWw8atnczEGaYUQgKF_UxoC-BU';
}
