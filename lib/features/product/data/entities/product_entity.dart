import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 1) // تأكد إن الرقم ده مش مستخدم قبل كده
class ProductEntity extends HiveObject {
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
  @HiveField(7)
  double? itemcount;

  ProductEntity({
    this.itemcount = 0,
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.ratingCount,
  });
}
