# Movies App with Clean Architecture and Unit Tests (in progress)

This project shows how to implement a movies app in Flutter.
I'm using Clean Archtecture, BloC and Unit Tests.
The app uses the TMDB API to fetch a list of movies, and includes features such as pagination and local or remote storage
(I'm still deciding wich storage option I will use).

<p float="left">
  <img src="web/icons/movie_1.png" width="250" />
  <img src="web/icons/movie_2.png" width="250" />
  <img src="web/icons/movie_3.png" width="250" />
  <img src="web/icons/movie_4.png" width="250" />
  <img src="web/icons/movie_5.png" width="250" />
  <img src="web/icons/movie_6.png" width="250" />
  <img src="web/icons/movie_7.png" width="250" />
  <img src="web/icons/movie_8.png" width="250" />
  <img src="web/icons/movie_9.png" width="250" />
  <img src="web/icons/movie_10.png" width="250" />

  
# Running the project
  
Before running, see instructions on how to get a TMDB API key.

# App Overview
  
The application is composed by five main sections: Now Playing, Popular, Top Rated, Soon and Trending.
Each movie shows as a poster using the image URL retrieved from the API. 
On Detail Movie Screen it's possible to see movie details such as: name, release date, rating, genres,
overview and cast. If a movie has a trailer available, the button "Watch Trailer" will appear and show 
a list of trailers.

# Supported state management solutions
  
bloc
cubit
  
# Packages 

- [dio](https://pub.dev/packages/dio)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_modular](https://pub.dev/packages/flutter_modular)
- [dartz](https://pub.dev/packages/dartz)
- [equatable](https://pub.dev/packages/equatable)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [carousel_slider](https://pub.dev/packages/carousel_slider)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)
- [http_mock_adapter](https://pub.dev/packages/http_mock_adapter)
- [mocktail](https://pub.dev/packages/mocktail)
- [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)

# Future Roadmap

- Add more screens
- Polish the UI
- Integrate a remote storage (probably Firebase)

