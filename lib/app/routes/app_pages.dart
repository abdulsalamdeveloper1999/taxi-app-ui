import 'package:get/get.dart';

import '../modules/OnBoard/bindings/on_board_binding.dart';
import '../modules/OnBoard/views/on_board_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ON_BOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => OnBoardView(),
      binding: OnBoardBinding(),
    ),
  ];
}
