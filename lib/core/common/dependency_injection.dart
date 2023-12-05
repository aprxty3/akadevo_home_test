import 'package:get/get.dart';

import '../../utils/service/global_variable.dart';
import '../../utils/service/storage_service.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    Get.log('=========dependencies 2222');
    Get.put(GlobalVariables(), permanent: true);
    // await Get.putAsync(() async => DbProvider().database);
    await Get.putAsync(() => StorageService().init());
  }
}
