import 'package:flutter/material.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/core/widgts/custom_button.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/iteme_image.dart';

class ProductItemViewBody extends StatelessWidget {
  const ProductItemViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(product.title!.substring(0, 10))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ItemeImage(image: product.image!, aspectRatio: 2.8 / 5),
              ),
              SizedBox(height: 45),
              Text(
                product.description!,
                style: Styles.textStyle18,
                maxLines: 7,
              ),
              SizedBox(height: 7),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 6.3),
                  Text(
                    "price: ${product.price!.toString()}",
                    style: Styles.textStyle16,
                  ),
                  Spacer(),
                  Text(
                    "rate: ${product.rating!.rate!.toString()}",
                    style: Styles.textStyle16,
                  ),
                ],
              ),
              SizedBox(height: 37),
              CustomButton(onTap: () {}, text: 'buy'),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
