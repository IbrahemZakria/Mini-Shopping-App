import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_shopping_app/core/error/failures.dart';
import 'package:mini_shopping_app/core/error/server_error.dart';
import 'package:mini_shopping_app/features/product/data/datasources/remote_data_source.dart/remote_data_sourse.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';
import 'package:mini_shopping_app/features/product/data/repositories/product_repo/product_repo.dart';

class ProductRepoImpel extends ProductRepo {
  final RemoteDataSourse remoteDataSources;

  ProductRepoImpel({required this.remoteDataSources});

  @override
  Future<Either<Failures, List<ProductModel>>> getAllProduct() async {
    try {
      List<ProductModel> products;

      products = await remoteDataSources.getAllProduct();
      return right(products);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerError.fromDioError(error));
      } else {
        return Left(ServerError(error.toString()));
      }
    }
  }
}
