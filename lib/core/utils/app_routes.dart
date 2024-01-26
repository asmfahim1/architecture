import 'package:architecture_getx/module/auth/login/view/login_screen.dart';
import 'package:architecture_getx/module/auth/login/view/splash_screen.dart';
import 'package:architecture_getx/module/home/view/data_pass_screen.dart';
import 'package:architecture_getx/module/home/view/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splashScreen = '/splash_screen';

  //Auth
  static const loginScreen = '/login_page';

  static const homeScreen = '/home_page';
  static const dataPassScreen = '/data_pass_page';

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      transition: Transition.noTransition,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: loginScreen,
      transition: Transition.noTransition,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: homeScreen,
      transition: Transition.noTransition,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: dataPassScreen,
      transition: Transition.noTransition,
      page: () {
        var map = Get.arguments['map'];
        return DataPassScreen(
          map: map,
        );
      },
    ),
  ];
}
