// import 'package:bookia/core/utils/colors.dart';
// import 'package:bookia/core/utils/text_styles.dart';
// import 'package:bookia/feature/home/models/book_model.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class WishlistScreen extends StatelessWidget {
//   const WishlistScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Wishlist',
//           style: TextStyles.styleSize24(color: AppColors.darkColor),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColors.whiteColor,
//         elevation: 0,
//       ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16),
//         itemCount: books.length,
//         separatorBuilder: (context, index) => Divider(height: 24),
//         itemBuilder: (context, index) {
//           final book = books[index];
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.asset(
//                   book.image,
//                   width: 100,
//                   height: 118,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Gap(16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       book.name,
//                       style: TextStyles.styleSize18(
//                         color: AppColors.nameCartColor,
//                       ),
//                     ),
//                     Gap(4),
//                     Text(
//                       '₹${book.price}',
//                       style: TextStyles.styleSize16(color: AppColors.darkColor),
//                     ),
//                     Gap(12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                           width: 181,
//                           child: OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadiusGeometry.circular(5),
//                               ),
//                               backgroundColor: AppColors.primaryColor,
//                               side: BorderSide(color: Colors.transparent),
//                             ),
//                             onPressed: () {},
//                             child: Text(
//                               'Add To Cart',
//                               style: TextStyles.styleSize14(
//                                 color: AppColors.whiteColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 30,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppColors.whiteColor,
//                 ),
//                 child: Icon(Icons.close, size: 16, color: AppColors.darkColor),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
