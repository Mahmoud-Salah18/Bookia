import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildRegisterBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?", style: TextStyles.styleSize14()),
            TextButton(
              onPressed: () {
                pushWithReplacement(context, Routes.login);
              },
              child: Text("Login Now", style: TextStyles.styleSize14()),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildRegisterBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Hello! Register to get started",
              style: TextStyles.styleSize30(),
            ),
            Gap(30),
            CustomTextField(controller: nameController, hint: "Username"),
            Gap(12),
            CustomTextField(controller: emailController, hint: "Email"),
            Gap(12),
            CustomTextField(controller: passwordController, hint: "Password"),
            Gap(12),
            CustomTextField(
              controller: confirmPasswordController,
              hint: "Confirm password",
            ),
            Gap(30),
            MainButton(text: "Register", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
