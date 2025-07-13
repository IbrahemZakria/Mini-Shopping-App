import 'dart:developer';

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
      ProductEntity productEntity = box.values.toList().firstWhere((p) {
        return p.id == product.id;
      });
      productEntity.itemcount = (productEntity.itemcount ?? 0) + 1;

      log("${productEntity.itemcount}kkll");
      await productEntity.save();
    } else {
      product.itemcount = 1;
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
      List<ProductEntity> products = box.values.toList();
      ProductEntity productEntity = products.firstWhere(
        (p) => p.id == product.id,
      );

      // قلل العدد
      if (productEntity.itemcount != null && productEntity.itemcount! > 1) {
        productEntity.itemcount = productEntity.itemcount! - 1;
        await productEntity.save(); // حفظ التعديل
      } else {
        productEntity.itemcount = productEntity.itemcount! - 1;
        await productEntity.save(); // حفظ التعديل
        // لو وصلت لـ 1 وعايز تشيله
        final key = box.keys.firstWhere(
          (k) => box.get(k)?.id == product.id,
          orElse: () => null,
        );
        if (key != null) {
          await box.delete(key); // حذف العنصر
        }
      }
    } else {}

    List<ProductEntity> carts = box.values.toList();
    log("عدد المنتجات الحالية: ${carts.length}");

    return carts;
  }
}
