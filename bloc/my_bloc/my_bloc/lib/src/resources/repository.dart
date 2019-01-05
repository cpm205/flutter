import 'dart:async';
import 'movie_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

//Repository: This is the central point from where the data flow is controlled.
class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}

