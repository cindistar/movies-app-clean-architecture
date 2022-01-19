# Movies App with Clean Architecture and Tests (in progress)

This project shows how to implement a movies app in Flutter.
I'm using Clean Archtecture, BloC and Unit Tests.
The project uses the TMDB API to fetch a list of movies, and includes features such as pagination and local or remote storage
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
