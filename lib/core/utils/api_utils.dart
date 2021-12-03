class ApiUrls {
  static String requestImage(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String upcomingMovies = '/movie/upcoming';
  static const String nowPlaying = '/movie/now_playing';
  static const String discoverMovies = '/discover/movie';
  static const String movieGenres = '/genre/movie/list';
  static const String search = '/search/multi';
  // static Function movieDetails = (int id) => '/movie/$id';
  // static Function movieCredits = (int id) => '/movie/$id/credits';
  // static Function movieVideos = (int id) => '/movie/$id/videos';
  // static Function similarMovies = (int id) => '/movie/$id/similar';
  static String trendingMovies (String timeWindow) => '/trending/movie/$timeWindow'; // * timeWindow: day or week
  // static Function trendingPersons =
  //     (String timeWindow) => '/trending/persons/$timeWindow';
  // static Function personDetails = (int id) => '/person/$id';
  // static Function personMovieCredits = (int id) => '/person/$id/movie_credits';
  // static Function videoThumbnail =
  //     (String key) => 'https://img.youtube.com/vi/$key/0.jpg';

}
