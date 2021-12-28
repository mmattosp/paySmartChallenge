import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final int id;

  DetailsPage({Key key, @required this.id});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> {

  @override
  void initState() {
    controller.fetchMovie(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: Icon(Icons.keyboard_arrow_left),
          color: Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Observer(builder: (_) {
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.error != null) {
            return Center(child: Text(controller.error));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  controller.movie.title,
                  style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    controller.movie.releaseDate,
                    style: TextStyle(
                      fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                ), 
                SizedBox(height: 10.0),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage('https://image.tmdb.org/t/p/w220_and_h330_face/${controller.movie.posterPath}')),
                    ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      controller.movie.overview,
                      style: TextStyle(fontSize: 14.0),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                ), 
                SizedBox(height: 10.0),
                Container(
                  height: 26.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.movie.genres.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                            controller.movie.genres[index].name,
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
          );
        }),
      ),
    );
  }
}
