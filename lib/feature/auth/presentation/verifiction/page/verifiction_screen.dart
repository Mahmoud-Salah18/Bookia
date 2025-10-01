import 'package:bookia/components/app_bar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
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
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildVerificationBody(context),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Didn’t receive code?", style: TextStyles.styleSize14()),
            TextButton(
              onPressed: () {
                pushWithReplacement(context, Routes.createNewPassword);
              },
              child: Text("Resend", style: TextStyles.styleSize14()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationBody(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColors.darkColor,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          pushWithReplacement(context, Routes.createNewPassword);
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
                  "OTP Verification",
                  style: TextStyles.styleSize30(),
                  textAlign: TextAlign.start,
                ),
                Gap(10),
                Text(
                  "Enter the verification code we just sent on your email address.",
                  style: TextStyles.styleSize16(color: AppColors.greyColor),
                ),
                Gap(30),
                Center(
                  child: Pinput(
                    controller: _otpController,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    onCompleted: (pin) {},
                  ),
                ),
                Gap(38),
                MainButton(
                  text: "Verify",
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.verifyCodeController.text =
                          _otpController.text;
                      cubit.checkForgetPassword();
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
