import 'package:akadevo_home_test/feature/infrastructure/datasource/screen_page_remote_datasouce.dart';
import 'package:get/get.dart';

import '../../feature/application/screen_page_app_service.dart';
import '../../feature/infrastructure/screen_page_repository.dart';
import '../network/api_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // PREPARATION BASIC DEPENDENCY
    Get.put(APIProvider());
    Get.put(APIProvider(), tag: 'APIProvider');
    // Get.put(DbProvider(), permanent: true);

    // Module ScreenPage
    Get.put(ScreenPageRemoteDatasource(), permanent: true);
    Get.put(ScreenPageRepository(), permanent: true);
    Get.put(ScreenPageAppService(), permanent: true);
  }
}
