import 'package:hive/hive.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/features/product/data/datasources/local_data_source.dart/cart_service_repo.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';

class CartservicesImpel extends CartServiceRepo {
  @override
  bool isProductInCart(ProductEntity product) {
    Box<ProductEntity> box = Hive.box<ProductEntity>(Constant.productBox);
    bool isProductInCart = box.values.any((p) => p.id == product.id);
    return isProductInCart;
  }

  @override
  Future<List<ProductEntity>> addProductToCart(ProductEntity product) async {
    Box<ProductEntity> box = Hive.box<ProductEntity>(Constant.productBox);

    bool iInCart = isProductInCart(product);
    if (iInCart) {
      ProductEntity productEntity = box.get(product.id)!;
      productEntity.itemcount! + 1;
    } else {
      await box.add(product);
    }
    List<ProductEntity> carts = box.values.toList();
    return carts;
  }

  @override
  Future<List<ProductEntity>> deleteProductFromTheCart(
    ProductEntity product,
  ) async {
    Box<ProductEntity> box = Hive.box<ProductEntity>(Constant.productBox);
    bool iInCart = isProductInCart(product);
    if (iInCart) {
      ProductEntity productEntity = box.get(product.id)!;
      productEntity.itemcount! - 1;
    } else {
      await box.delete(product);
    }
    List<ProductEntity> carts = box.values.toList();
    return carts;
  }
}
