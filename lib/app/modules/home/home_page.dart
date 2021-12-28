import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/shared/models/movie_model.dart';
import 'home_controller.dart';
import 'widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController;
  ListView list;

  @override
  void initState() {
    controller.fetchGenres();
    scrollController = ScrollController();
    controller.fetchAll();
    scrollController.addListener(() {
      if (scrollController.position != null && scrollController.position.atEdge && scrollController.position.pixels != 0) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 28,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease
        );
        controller.fetchAll();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: TextField(
          onChanged: controller.movieSearch,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            hintText: 'Buscar',
            border: OutlineInputBorder(),
          ),
        ),
      ),
      body:  Observer(
        builder: (_) => ListView(
          controller: scrollController,
          padding: EdgeInsets.symmetric(vertical: 4.0),
          children: buildListChildren(controller.movies, controller.loading, controller.error),
        )
      ),
    );
  }

  List<Widget> buildListChildren(List<MovieModel> movies, bool loading, String error) {
    
    if (error != null) return [Center(child: Text(controller.error))];

    List<Widget> children = [];
    if (movies.isEmpty && !loading) {
      children.add(Center(child: Text('Nenhum filme encontrada.')));
    } else if (movies.isNotEmpty) {
      children.addAll(movies.map((e) => MovieCard(movie: e)));
    }
              
    if (loading) {
      children.add(SizedBox(height: 4));
      children.add(Center( child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator())));
      children.add(SizedBox(height: 4));
    }

    return children;
  }
}
