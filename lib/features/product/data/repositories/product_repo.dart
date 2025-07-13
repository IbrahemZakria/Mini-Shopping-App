import 'package:dartz/dartz.dart';
import 'package:mini_shopping_app/core/error/failures.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failures, List<ProductModel>>> getAllProduct();
}
