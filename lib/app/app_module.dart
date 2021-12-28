import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'routes.dart';
import 'shared/helpers/custom_dio.dart';
import 'shared/pages/no_connectivity_page.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomDio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Routes.HOME, module: HomeModule()),
        // ModularRouter(Routes.PROMOTION, module: PromotionModule()),
        ModularRouter('/no_connnectivity',
            child: (_, args) => NoConnectivityPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
