import 'package:flutter/material.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/loading/product_loading_item.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoadingBody extends StatelessWidget {
  const ProductLoadingBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 🔷 Placeholder for Carousel
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
        // 🔷 Divider
        SliverToBoxAdapter(
          child: Divider(
            thickness: 8,
            color: Styles.kprimarycolor.withAlpha(100),
          ),
        ),
        // 🔷 List of Shimmered Items
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 15, // عدد العناصر الوهمية
                itemBuilder: (context, index) {
                  return const ProductLoadingItem();
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
