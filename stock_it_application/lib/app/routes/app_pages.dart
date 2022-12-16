import 'package:get/get_navigation/src/routes/get_route.dart';
import '../home/Binding/homeBinding.dart';
import '../home/Views/homepage.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
