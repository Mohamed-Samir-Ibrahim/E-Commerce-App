import 'package:dartz/dartz.dart';

import '../../../domain/entities/categories_response_entity.dart';
import '../../../domain/entities/errors.dart';
import '../../../domain/repository/data_sources/home_tab_remote_data_source_contract.dart';
import '../../api/api_manager.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSourceContract {
  ApiManager apiManager;

  HomeTabRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Errors, CategoriesBrandsResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold(
      // Either Error :
      (error) {
        return Left(error);
      },
      // Either Success :
      (response) {
        return Right(response);

        ///
        //* MARK: There is no coverting method her from DTO to Entity; because DTO extends from Entity
        //* and become one of its sub-types `Polymorphism`
      },
    );
  }

  @override
  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllBrands() async {
    var either = await apiManager.getAllBrands();
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }
}
