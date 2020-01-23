class TvShow {
  String name;
  int id;
  String backdropPath;
  String overview;
  String posterPath;
  String voteAvarage;

  TvShow(
      {this.name,
      this.backdropPath,
      this.overview,
      this.posterPath,
      this.voteAvarage,
      this.id});

}

class Movie {
  String title;
  int id;
  String backdropPath;
  String overview;
  String posterPath;
  String voteAvarage;

  Movie(
      {this.title,
      this.backdropPath,
      this.overview,
      this.posterPath,
      this.voteAvarage,
      this.id});

}
