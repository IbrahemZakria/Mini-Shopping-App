import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';

abstract class CartServiceRepo {
  bool isProductInCart(ProductEntity product);

  Future<void> addProductToCart(ProductEntity product);

  Future<void> deleteProductFromTheCart(ProductEntity product);
}
