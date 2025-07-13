import 'package:mini_shopping_app/features/product/data/datasources/local_data_source.dart/cart_service_repo.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';
import 'package:mini_shopping_app/features/product/data/repositories/cart_repo/cart_repo.dart';

class CartRepoImpel extends CartRepo {
  final CartServiceRepo cartServiceRepo;

  CartRepoImpel({required this.cartServiceRepo});

  @override
  Future<List<ProductEntity>> addProductToCart(ProductEntity product) async {
    List<ProductEntity> cart = await cartServiceRepo.addProductToCart(product);
    return cart;
  }

  @override
  Future<List<ProductEntity>> deleteProductFromCart(
    ProductEntity product,
  ) async {
    List<ProductEntity> cart = await cartServiceRepo.deleteProductFromTheCart(
      product,
    );
    return cart;
  }
}
