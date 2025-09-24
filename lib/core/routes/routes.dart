import 'package:bookia/feature/auth/presentation/create_new_password/page/create_new_password_screen.dart';
import 'package:bookia/feature/auth/presentation/forgot_password/page/forgot_password_screen.dart';
import 'package:bookia/feature/auth/presentation/login/page/login_screen.dart';
import 'package:bookia/feature/auth/presentation/password_changed/page/password_changed_screen.dart';
import 'package:bookia/feature/auth/presentation/register/page/register_screen.dart';
import 'package:bookia/feature/auth/presentation/verifiction/page/verifiction_screen.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:bookia/feature/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = "/splash";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgotPassword";
  static const String verification = "/verification";
  static const String createNewPassword = "/CreateNewPassword";
  static const String passwordChanged = "/PasswordChanged";

  static GoRouter routes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: verification,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: createNewPassword,
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: passwordChanged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
    ],
  );
}
