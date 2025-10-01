import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarWithBack(), body: _buildLoginBody(context));
  }

  Widget _buildLoginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          pushWithReplacement(context, Routes.passwordChanged);
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
                CustomTextField(
                  controller: cubit.newPasswordController,
                  hint: "New Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter new password";
                    }
                    return null;
                  },
                ),
                Gap(15),
                CustomTextField(
                  controller: cubit.confirmPasswordController,
                  hint: "Confirm Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter confirm password";
                    }
                    return null;
                  },
                ),
                Gap(38),
                MainButton(
                  text: "Reset Password",
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.resetPassword();
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
