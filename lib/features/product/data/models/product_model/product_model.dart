import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';

import 'rating.dart';

class ProductModel extends ProductEntity {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  }) : super(
         category: category,
         description: description,
         id: id,
         title: title,
         price: price,
         image: image,
         ratingCount: rating!.count!.toDouble(),
       );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    description: json['description'] as String?,
    category: json['category'] as String?,
    image: json['image'] as String?,
    rating: json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating?.toJson(),
  };
}
