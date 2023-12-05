import 'package:akadevo_home_test/core/network/exception.dart';
import 'package:akadevo_home_test/feature/infrastructure/model/screen_page_model.dart';
import 'package:dartz/dartz.dart';

abstract class ScreenPageRepositoryBase {
  Future<Either<GenericException, List<DataList>>> dataList();
}
