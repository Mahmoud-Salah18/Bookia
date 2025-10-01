import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BookCart extends StatelessWidget {
  const BookCart({super.key, required this.model});

  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.push(Routes.bookDetails, extra: model);
        },
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Hero(
                  tag: model.id,
                  child: Image.asset(
                    model.image,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(10),
              Text(
                model.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.styleSize18(color: AppColors.darkColor),
              ),
              Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹${model.price}",
                    style: TextStyles.styleSize16(color: AppColors.darkColor),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Buy",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
