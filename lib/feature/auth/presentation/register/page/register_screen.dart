import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildRegisterBody(context),
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

  Widget _buildRegisterBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          pushWithReplacement(context, Routes.login);
        } else if (state is AuthErrorState) {
          pop(context);
          showErrorDialog(context, state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Text(
                  "Hello! Register to get started",
                  style: TextStyles.styleSize30(),
                ),
                Gap(30),
                CustomTextField(
                  controller: cubit.nameController,
                  hint: "Username",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomTextField(
                  controller: cubit.emailController,
                  hint: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomTextField(
                  controller: cubit.passwordController,
                  hint: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomTextField(
                  controller: cubit.confirmPasswordController,
                  hint: "Confirm password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm Password is required";
                    }
                    return null;
                  },
                ),
                Gap(30),
                MainButton(
                  text: "Register",
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.register();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
