import 'package:get/get.dart';

class GlobalVariables extends GetxController {
  var onBackground = false.obs;
  var notificationId = ''.obs;

  GlobalVariables() {
    onBackground.value = false;
    notificationId.value = '';
  }

  setOnBackground(bool value) => onBackground.value = value;

  setNotificationId(String value) => notificationId.value = value;
}
