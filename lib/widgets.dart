import 'package:flutter/material.dart';
import 'package:movie_info/api_functions.dart';


class TopTvShows extends StatelessWidget {
  const TopTvShows({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTopTvShows(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
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
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original' +
                                    snapshot.data[index].backdropPath),
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
      );
  }
}