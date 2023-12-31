import 'package:bank/src/pages/connect/connect_binding.dart';
import 'package:bank/src/pages/connect/connect_view.dart';
import 'package:bank/src/pages/home/home_view.dart';
import 'package:get/get.dart';

import '../pages/home/home_binding.dart';
import '../pages/splash/splash_binding.dart';
import '../pages/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.connect,
      page: () => const ConnectPage(),
      binding: ConnectBinding(),
    ),
  ];
}
