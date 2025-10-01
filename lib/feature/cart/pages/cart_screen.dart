import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Cart',
          style: TextStyles.styleSize24(color: AppColors.darkColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: books.length,
              separatorBuilder: (_, __) => const Divider(height: 24),
              itemBuilder: (context, index) {
                final book = books[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        book.image,
                        width: 100,
                        height: 118,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.name,
                            style: TextStyles.styleSize18(
                              color: AppColors.nameCartColor,
                            ),
                          ),
                          Gap(4),
                          Text(
                            '₹${book.price}',
                            style: TextStyles.styleSize16(
                              color: AppColors.darkColor,
                            ),
                          ),
                          Gap(32),
                          Row(
                            children: [
                              Icon(Icons.add),
                              Gap(15),
                              Text(
                                '01',
                                style: TextStyles.styleSize18(
                                  color: AppColors.darkColor,
                                ),
                              ),
                              Gap(15),
                              Icon(Icons.remove),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: AppColors.darkColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 28, left: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyles.styleSize20(
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text(
                        '\$ 95.00',
                        style: TextStyles.styleSize20(
                          color: AppColors.darkColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(16),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Checkout',
                      style: TextStyles.styleSize20(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
