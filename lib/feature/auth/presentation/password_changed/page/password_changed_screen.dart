import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.successSvg),
              Gap(35),
              Text(
                "Password Changed!",
                style: TextStyles.styleSize24(color: AppColors.darkColor),
              ),
              Text(
                "Your password has been changed successfully.",
                style: TextStyles.styleSize14(color: AppColors.greyColor),
              ),
              Gap(40),
              MainButton(
                text: "Back to Login",
                onPressed: () {
                  pushWithReplacement(context, Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
