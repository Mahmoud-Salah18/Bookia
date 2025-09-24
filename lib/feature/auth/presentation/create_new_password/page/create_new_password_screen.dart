import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarWithBack(), body: _buildLoginBody());
  }

  Padding _buildLoginBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create new password",
              style: TextStyles.styleSize30(),
              textAlign: TextAlign.start,
            ),
            Gap(10),
            Text(
              "Your new password must be unique from those previously used.",
              style: TextStyles.styleSize16(color: AppColors.greyColor),
            ),
            Gap(30),
            CustomTextField(controller: emailController, hint: "New Password"),
            Gap(15),
            CustomTextField(
              controller: passwordController,
              hint: "Confirm Password",
            ),
            Gap(38),
            MainButton(text: "Reset Password", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
