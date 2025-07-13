import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';

abstract class CartRepo {
  Future<List<ProductEntity>> addProductToCart(ProductEntity product);
  Future<List<ProductEntity>> deleteProductFromCart(ProductEntity product);
}
