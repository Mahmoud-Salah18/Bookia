import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/models/book_model.dart';
import 'package:bookia/feature/home/widgets/book_cart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Seller",
          style: TextStyles.styleSize24(color: AppColors.darkColor),
        ),
        Gap(16),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            mainAxisExtent: 300,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) => BookCart(model: books[index]),
        ),
      ],
    );
  }
}
