import 'package:bookia/feature/auth/data/models/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var newPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var verifyCodeController = TextEditingController();

  register() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      verifyCode: verifyCodeController.text,
      newPassword: newPasswordController.text,
    );

    var res = await AuthRepo.register(params);

    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Registration failed !"));
    }
  }

  login() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );

    var res = await AuthRepo.login(params);

    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Login failed !"));
    }
  }

  forgetPassword() async {
    emit(AuthLoadingState());

    var params = AuthParams(email: emailController.text);

    var res = await AuthRepo.forgetPassword(params);

    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Login failed !"));
    }
  }

  checkForgetPassword() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      email: emailController.text,
      verifyCode: verifyCodeController.text,
    );

    var res = await AuthRepo.checkForgetPassword(params);

    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Invalid Verify !"));
    }
  }

  resetPassword() async {
  emit(AuthLoadingState());

  var params = AuthParams(
    verifyCode: verifyCodeController.text,
    newPassword: newPasswordController.text,
    confirmNewPassword: confirmPasswordController.text,
  );

  var res = await AuthRepo.resetPassword(params);

  if (res != null) {
    emit(AuthSuccessState());
  } else {
    emit(AuthErrorState(message: "Reset failed !"));
  }
}

}
