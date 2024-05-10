import 'package:dartz/dartz.dart';

import '../../../domain/entities/categories_response_entity.dart';
import '../../../domain/entities/errors.dart';
import '../../../domain/repository/data_sources/home_tab_remote_data_source_contract.dart';
import '../../../domain/repository/repository/home_tab_repository_contract.dart';

class HomeTabRepositoryImpl implements HomeTabRepositoryContract {
  HomeTabRemoteDataSourceContract remoteDataSourceDelegate;

  HomeTabRepositoryImpl({required this.remoteDataSourceDelegate});

  @override
  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllCategories() {
    return remoteDataSourceDelegate.getAllCategories();
  }

  @override
  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllBrands() {
    return remoteDataSourceDelegate.getAllBrands();
  }
}
