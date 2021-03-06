import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_info/models.dart';
import 'package:http/http.dart' as http;

Future<List<TvShow>> getTopTvShows() async {
  List<TvShow> popularTvshows = [];
  http.Response response = await http.get(
      'https://api.themoviedb.org/3/tv/popular?api_key=' +
          DotEnv().env['Auth3token'] +
          '&language=en-US&page=1');
  var jsonData = jsonDecode(response.body);
  for (var Tv in jsonData["results"]) {
    TvShow tvshow = TvShow(
        name: Tv["name"],
        backdropPath: Tv["backdrop_path"],
        overview: Tv['overview'],
        posterPath: Tv['poster_path'],
        voteAvarage: Tv['vote_avarage'],
        id: Tv['id']);
    popularTvshows.add(tvshow);
  }
  return popularTvshows;
}

Future<List<Movie>> getTopMovies() async {
  List<Movie> popularMovies = [];
  http.Response response = await http.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=' +
          DotEnv().env['Auth3token'] +
          '&language=en-US&page=1');
  var jsonData = jsonDecode(response.body);
  for (var Tv in jsonData["results"]) {
    Movie show = Movie(
        title: Tv["title"],
        backdropPath: Tv["backdrop_path"],
        overview: Tv['overview'],
        posterPath: Tv['poster_path'],
        voteAvarage: Tv['vote_avarage'],
        id: Tv['id']);
    popularMovies.add(show);
  }
  return popularMovies;
}
