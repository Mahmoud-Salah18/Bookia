import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/home/widgets/best_seller_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.cardColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppImages.logoSvg, height: 30),
                  Gap(8),
                ],
              ),
              IconButton(
                icon: Icon(Icons.search, color: AppColors.darkColor),
                onPressed: () {
                  pushTo(context, Routes.search);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppImages.books),
              SizedBox(height: 20),
              BestSellerBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
