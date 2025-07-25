import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';

abstract class CartServiceRepo {
  bool isProductInCart(ProductEntity product);

  Future<List<ProductEntity>> addProductToCart(ProductEntity product);

  Future<List<ProductEntity>> deleteProductFromTheCart(ProductEntity product);
}
