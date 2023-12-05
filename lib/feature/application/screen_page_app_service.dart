import 'package:akadevo_home_test/core/network/exception.dart';
import 'package:akadevo_home_test/feature/infrastructure/model/screen_page_model.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../domain/screen_page_repository_base.dart';
import '../infrastructure/screen_page_repository.dart';

class ScreenPageAppService {
  final ScreenPageRepositoryBase _repository = Get.find<ScreenPageRepository>();

  Future<Either<GenericException, List<DataList>>> dataList() async {
    final response = await _repository.dataList();

    return response.fold((l) => Left(l), (r) => Right(r));
  }
}