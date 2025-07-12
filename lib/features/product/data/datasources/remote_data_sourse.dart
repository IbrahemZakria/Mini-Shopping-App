import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';

abstract class RemoteDataSourse {
  Future<List<ProductModel>> getAllProduct();
  Future<ProductModel> addProductToCart();
  Future<ProductModel> deleteProductFromCart();
}
