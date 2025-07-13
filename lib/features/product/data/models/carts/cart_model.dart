import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 2)
class CartModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  double? price;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? image;

  @HiveField(6)
  double? ratingCount;

  CartModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.ratingCount,
  });
}
