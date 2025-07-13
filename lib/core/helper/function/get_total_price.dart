import 'package:hive/hive.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';

double getTotalPriceFromBox() {
  final box = Hive.box<ProductEntity>(Constant.productBox);

  double total = 0.0;

  for (var item in box.values) {
    if (item.price != null && item.itemcount != null) {
      total += item.price! * item.itemcount!;
    }
  }
  return total;
}
