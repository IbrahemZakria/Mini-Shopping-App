import 'package:hive/hive.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';

int getItemCountByProduct(ProductEntity product) {
  final box = Hive.box<ProductEntity>(Constant.productBox);

  ProductEntity? existingProduct;
  for (var item in box.values) {
    if (item.id == product.id) {
      existingProduct = item;
      break;
    }
  }

  if (existingProduct != null) {
    return existingProduct.itemcount!.toInt();
  } else {
    return 0;
  }
}
