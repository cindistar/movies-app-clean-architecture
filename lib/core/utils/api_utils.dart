class ApiUrls {
  static String requestImage(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';

  static String popularMovies(int page) => '/movie/popular?&page=$page';
  static String topRatedMovies(int page) => '/movie/top_rated?&page=$page';
  static String upcomingMovies(int page) => '/movie/upcoming?&page=$page';
  static String nowPlaying(int page) => '/movie/now_playing?&page=$page';
  //static String discoverMovies(int page) => '/discover/movie';
  static String movieGenres() => '/genre/movie/list';
  static String searchMovies(String searchText) => '/search/movie?&query=$searchText';
  static String movie(int id) => '/movie/$id?';
  static String movieByGenres(int genreId) => '/movie/popular?&with_genres=$genreId';
  static String movieCredits(int id) => '/movie/$id/credits?';
  static String movieVideos(int id) => '/movie/$id/videos?';
  // static Function similarMovies = (int id) => '/movie/$id/similar';
  static String trendingMovies(int page) =>
      '/trending/movie/day?&page=$page'; // * timeWindow: day or week
  // static Function trendingPersons =
  //     (String timeWindow) => '/trending/persons/$timeWindow';
  // static Function personDetails = (int id) => '/person/$id';
  // static Function personMovieCredits = (int id) => '/person/$id/movie_credits';
  static String videoThumbnail(String key) => 'https://img.youtube.com/vi/$key/0.jpg';

}
