import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/home/models/book_model.dart';
import 'package:bookia/feature/home/widgets/book_cart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBarWithBack(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomTextField(
                controller: searchController,
                hint: "Search Store",
                prefixIcon: Icon(Icons.search, color: AppColors.darkColor),
              ),
            ),
            Gap(20),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 300,
                ),
                itemCount: books.length,
                itemBuilder: (context, index) => BookCart(model: books[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
