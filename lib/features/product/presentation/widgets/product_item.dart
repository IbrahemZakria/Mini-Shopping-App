import 'package:flutter/material.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/core/widgts/custome_text.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_item_view.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/iteme_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductItemView.routeName,
          arguments: productModel,
        );
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.17,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            ItemeImage(image: productModel.image!, aspectRatio: 2.5 / 4),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeText(
                  text: productModel.title!,
                  textStyle: Styles.textStyle20.copyWith(
                    fontFamily: "GT-Sectra-Fine-Regular",
                  ),
                ),
                SizedBox(height: 3),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Row(
                    children: [
                      Text(
                        productModel.price.toString(),
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),

                      SizedBox(width: 6.3),
                      Text("rate", style: Styles.textStyle16),
                      SizedBox(width: 8),
                      Text(
                        productModel.rating!.rate.toString(),
                        style: Styles.textStyle14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
