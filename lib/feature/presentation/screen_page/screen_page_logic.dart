import 'dart:async';
import 'dart:convert';

import 'package:akadevo_home_test/feature/infrastructure/model/screen_page_model.dart';
import 'package:akadevo_home_test/utils/service/storage.dart';
import 'package:get/get.dart';

import '../../application/screen_page_app_service.dart';
import 'screen_page_state.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenPageLogic extends GetxController {
  final ScreenPageState state = ScreenPageState();
  final _screenPageAppService = Get.find<ScreenPageAppService>();
  final storage = Get.find<SharedPreferences>();
  Timer? _timer;

  @override
  void onInit() async {
    super.onInit();
    await fetchData();
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      fetchData(); // Sync and save every 1 minute
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchData() async {
    await _screenPageAppService.dataList().then((value) {
      value.fold((l) => Left(l), (r) {
        state.dataList = r;
        if (state.dataSaveToLocal < state.dataList.length) {
          saveToLocal([state.dataList[state.dataSaveToLocal]]);
          state.dataSaveToLocal++;
        }
        update();
        Right(r);
      });
    });
  }

  void saveToLocal(List<DataList> data) {
    final List<DataList> existingData = loadLocalData();
    existingData.addAll(data);

    final List<Map<String, dynamic>> dataListMap =
        existingData.map((item) => item.toJson()).toList();

    storage.setString(StorageConstants.dataList, json.encode(dataListMap));
    Get.log(existingData.toString());
  }

  List<DataList> loadLocalData() {
    final String? jsonString = storage.getString(StorageConstants.dataList);
    if (jsonString != null) {
      final List<dynamic> decodedList = json.decode(jsonString);

      return decodedList.map((item) => DataList.fromJson(item)).toList();
    }
    return [];
  }
}
