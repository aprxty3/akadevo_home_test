import 'dart:convert';

import 'package:akadevo_home_test/core/network/api_provider.dart';
import 'package:akadevo_home_test/core/network/exception.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../model/screen_page_model.dart';

class ScreenPageRemoteDatasource {
  final _apiProvider = Get.find<APIProvider>();

  Future<Either<GenericException, List<DataList>>> dataList() async {
    return await _apiProvider.getData('/albums').then(
          (value) => value.fold(
            (l) => Left(l),
            (r) {
              if (r.statusCode != 200) {
                return Left(
                  NullEmptyException(code: ExceptionCode.unknown),
                );
              } else {
                return Right(dataListFromJson(json.encode(r.data)));
              }
            },
          ),
        );
  }
}
