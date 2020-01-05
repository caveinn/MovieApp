import 'dart:convert';
import 'package:movie_info/models.dart';
import 'package:http/http.dart' as http;

Future<List<TvShow>> getTopTvShows() async {
    print('calling');
    List<TvShow> popularTvshows = [];
    http.Response response = await http.get(
        'https://api.themoviedb.org/3/tv/popular?api_key=b1e846e669f871ed3ccd7e68c39a5244&language=en-US&page=1');
    var jsonData = jsonDecode(response.body);
    for (var Tv in jsonData["results"]) {
      TvShow show = TvShow(
          name: Tv["name"],
          backdropPath: Tv["backdrop_path"],
          overview: Tv['overview'],
          posterpath: Tv['poster_path'],
          voteAvarage: Tv['vote_avarage'],
          id: Tv['id']);
      popularTvshows.add(show);
    }
    return popularTvshows;
  }