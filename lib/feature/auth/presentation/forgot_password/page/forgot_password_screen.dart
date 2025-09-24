import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
            Text("Remember Password?", style: TextStyles.styleSize14()),
            TextButton(
              onPressed: () {
                pushWithReplacement(context, Routes.login);
              },
              child: Text("Login", style: TextStyles.styleSize14()),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password?",
              style: TextStyles.styleSize30(),
              textAlign: TextAlign.start,
            ),
            Gap(10),
            Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: TextStyles.styleSize14(color: AppColors.greyColor),
            ),
            Gap(30),
            CustomTextField(
              controller: emailController,
              hint: "Enter your email",
            ),
            Gap(38),
            MainButton(text: "Send Code", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
