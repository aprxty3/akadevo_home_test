import 'package:akadevo_home_test/feature/presentation/screen_page/screen_page_binding.dart';
import 'package:get/get.dart';

import '../../feature/presentation/screen_page/screen_page_page.dart';

class AppRouter {
  static const initial = ScreenPagePage.namePath;
  static final routes = [
    GetPage(
      name: ScreenPagePage.namePath,
      page: () => ScreenPagePage(),
      binding: ScreenPageBinding(),
    ),
  ];
}
