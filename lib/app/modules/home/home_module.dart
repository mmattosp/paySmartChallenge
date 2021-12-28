import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/modules/details/details_controller.dart';
import 'package:teste/app/modules/details/details_page.dart';
import 'package:teste/app/modules/home/routes.dart';
import 'package:teste/app/shared/helpers/custom_dio.dart';
import 'package:teste/app/shared/repositories/interfaces/movie_repository_interface.dart';
import 'package:teste/app/shared/repositories/movie_repository.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMovieRepository>((i) => MovieRepository(i.get<CustomDio>())),
        Bind((i) => HomeController(i.get<IMovieRepository>())),
        Bind((i) => DetailsController(i.get<IMovieRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Routes.ROOT, child: (i, args) => HomePage()),
        ModularRouter(Routes.DETAIL, child: (i, args) => DetailsPage(id: args.data['id'])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
