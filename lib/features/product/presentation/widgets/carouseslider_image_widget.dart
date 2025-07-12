import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_item_view.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/iteme_image.dart';

class CarousesliderImageWidget extends StatelessWidget {
  const CarousesliderImageWidget({
    this.onPageChanged,
    super.key,
    this.spaceBetweenItem = .3,
    this.centerheadline = true,
    this.infintyScroll = false,
    required this.product,
  });
  final double spaceBetweenItem;
  final List<ProductModel> product;

  final bool centerheadline;
  final bool infintyScroll;
  final void Function(int index, CarouselPageChangedReason reason)?
  onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          onPageChanged: onPageChanged,

          initialPage: 2,
          height: double.infinity,
          enlargeCenterPage: centerheadline,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          animateToClosest: true,
          enableInfiniteScroll: infintyScroll,
          padEnds: true,
          pauseAutoPlayInFiniteScroll: true,
          pauseAutoPlayOnTouch: true,
          autoPlay: true,
          aspectRatio: 1 / 4, // Adjust the aspect ratio as needed
          viewportFraction:
              spaceBetweenItem, // Adjust the viewport fraction as needed
        ),
        itemCount: product.length,

        itemBuilder: (context, index, realIndex) {
          return ItemeImage(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductItemView.routeName,
                arguments: product[index],
              );
            },
            image: product[index].image!,
          );
        },
      ),
    );
  }
}
