import 'package:akadevo_home_test/core/network/exception.dart';
import 'package:akadevo_home_test/feature/domain/screen_page_repository_base.dart';
import 'package:akadevo_home_test/feature/infrastructure/model/screen_page_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'datasource/screen_page_remote_datasouce.dart';

class ScreenPageRepository implements ScreenPageRepositoryBase {
  final _remoteDatasource = Get.find<ScreenPageRemoteDatasource>();

  @override
  Future<Either<GenericException, List<DataList>>> dataList() async {
    final response = await _remoteDatasource.dataList();

    return response.fold((l) => Left(l), (r) => Right(r));
  }
}
