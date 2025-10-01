import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.model});
  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.cardColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  pop(context);
                },
                child: Row(
                  children: [SvgPicture.asset(AppImages.backSvg), Gap(8)],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AppImages.bookmarkSvg),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(10),
            Hero(
              tag: model.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  model.image,
                  width: 220,
                  height: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(20),
            Text(model.name, style: TextStyles.styleSize30()),
            Gap(6),
            Text(
              "Broché",
              style: TextStyles.styleSize16(color: AppColors.primaryColor),
            ),
            Gap(16),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
              "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
              "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
              textAlign: TextAlign.justify,
              style: TextStyles.styleSize12(),
            ),
            Gap(80),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(color: AppColors.whiteColor),
          child: Row(
            children: [
              Text(
                "₹${model.price}",
                style: TextStyles.styleSize24(color: AppColors.darkColor),
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: MainButton(
                  bgColor: AppColors.darkColor,
                  borderColor: AppColors.darkColor,
                  text: "Add To Cart",
                  onPressed: () {},
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
