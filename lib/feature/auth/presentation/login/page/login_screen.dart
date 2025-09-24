import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/auth/presentation/login/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildLoginBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don’t have an account?", style: TextStyles.styleSize14()),
            TextButton(
              onPressed: () {
                pushWithReplacement(context, Routes.register);
              },
              child: Text("Register Now", style: TextStyles.styleSize14()),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildLoginBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Welcome back! Glad to see you, Again!",
              style: TextStyles.styleSize30(),
            ),
            Gap(30),
            CustomTextField(
              controller: emailController,
              hint: "Enter your email",
            ),
            Gap(12),
            CustomTextField(
              controller: passwordController,
              hint: "Enter your password",
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset(AppImages.eyeSvg)],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  overlayColor: Colors.transparent,
                ),
                onPressed: () {
                  pushTo(context, Routes.forgotPassword);
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyles.styleSize14(color: AppColors.greyColor),
                ),
              ),
            ),
            Gap(20),
            MainButton(text: "Login", onPressed: () {}),
            Gap(20),
            SocialLogin(),
          ],
        ),
      ),
    );
  }
}
