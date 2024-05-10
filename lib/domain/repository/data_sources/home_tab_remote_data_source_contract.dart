import 'package:dartz/dartz.dart';

import '../../entities/categories_response_entity.dart';
import '../../entities/errors.dart';

abstract class HomeTabRemoteDataSourceContract {
  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllCategories();

  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllBrands();
}
