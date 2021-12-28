import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/shared/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  const MovieCard(
      {Key key, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(movie != null);
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/home/details', arguments: {
              'id': movie.id,
            },),
      child: Container(
        padding: EdgeInsets.zero,
        child: Card(
          margin: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                          height: 110,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://image.tmdb.org/t/p/w220_and_h330_face/${movie.backdropPath}')),
                            ),
                        ),
                        SizedBox(width: 8.0),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                movie.title,
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6.0),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  movie.releaseDate,
                                  style: TextStyle(
                                      fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).primaryColor,
                                  ),
                              ),
                              SizedBox(height: 6.0),
                              Container(
                              height: 26.0,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: movie.genres.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text(
                                        movie.genres[index].name,
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                              ),
                            ), 
                            ],
                          ),
                        ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      )      
    );
  }
}
