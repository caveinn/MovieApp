import 'package:flutter/material.dart';
import 'package:movie_info/api_functions.dart';

class TopTvShows extends StatelessWidget {
  const TopTvShows({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
          child: FutureBuilder(
        future: getTopTvShows(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                String backdropPath = snapshot.data[index].backdropPath;
                return Container(
                   width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(
                        snapshot.data[index].overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image(
                              fit: BoxFit.fill,
                              image: backdropPath == null
                                  ? AssetImage('lib/assets/movie_default.jpeg')
                                  : NetworkImage(
                                      'https://image.tmdb.org/t/p/original' +
                                          backdropPath),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('loading..');
          }
        },
      ),
    );
  }
}

class TopMovies extends StatelessWidget {
  const TopMovies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: FutureBuilder(
        future: getTopMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                String backdropPath = snapshot.data[index].backdropPath;
                return Container(
                  width: 300,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(
                        snapshot.data[index].overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image(
                              fit: BoxFit.fill,
                              image: backdropPath == null
                                  ? AssetImage('lib/assets/movie_default.jpeg')
                                  : NetworkImage(
                                      'https://image.tmdb.org/t/p/original' +
                                          backdropPath),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('loading..');
          }
        },
      ),
    );
  }
}
