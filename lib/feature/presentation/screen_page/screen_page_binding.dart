import 'package:get/get.dart';

import 'screen_page_logic.dart';

class ScreenPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScreenPageLogic());
  }
}
