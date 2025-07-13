import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';
import 'package:mini_shopping_app/features/product/data/repositories/cart_repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;
  Future<List<ProductEntity>> addproductToCart(ProductEntity product) async {
    emit(CartLoadingState());

    List<ProductEntity> products = await cartRepo.addProductToCart(product);
    log("${product.itemcount}");
    emit(CartSuccessState(products: products));
    return products;
  }

  Future<List<ProductEntity>> deleteproductFromCart(
    ProductEntity product,
  ) async {
    emit(CartLoadingState());
    List<ProductEntity> products = await cartRepo.deleteProductFromCart(
      product,
    );
    log("${products.length}");

    emit(CartSuccessState(products: products));
    return products;
  }
}
