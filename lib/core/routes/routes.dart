import 'package:bookia/feature/auth/presentation/create_new_password/page/create_new_password_screen.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/forgot_password/page/forgot_password_screen.dart';
import 'package:bookia/feature/auth/presentation/login/page/login_screen.dart';
import 'package:bookia/feature/auth/presentation/password_changed/page/password_changed_screen.dart';
import 'package:bookia/feature/auth/presentation/register/page/register_screen.dart';
import 'package:bookia/feature/auth/presentation/verifiction/page/verifiction_screen.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/pages/place_order_screen.dart';
import 'package:bookia/feature/home/data/models/best_seller_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/page/details_screen.dart';
import 'package:bookia/feature/home/presentation/page/home_screen.dart';
import 'package:bookia/feature/main/main_app_screen.dart';
import 'package:bookia/feature/search/pages/search_screen.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:bookia/feature/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = "/splash";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgotPassword";
  static const String verification = "/verification";
  static const String createNewPassword = "/createNewPassword";
  static const String passwordChanged = "/passwordChanged";
  static const String home = "/home";
  static const String search = "/search";
  static const String details = "/details";
  static const String cart = "/cart";
  static const String main = "/main";
  static const String placeOrder = "/placeOrder";

  static GoRouter routes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgotPasswordScreen(),
        ),
      ),
      GoRoute(
        path: verification,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: VerificationScreen(),
        ),
      ),
      GoRoute(
        path: createNewPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: CreateNewPasswordScreen(),
        ),
      ),
      GoRoute(
        path: passwordChanged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: main,
        builder: (context, state) => MainAppScreen(index: state.extra as int?),
      ),
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(path: search, builder: (context, state) => SearchScreen()),
      GoRoute(
        path: details,
        builder: (context, state) {
          var book = state.extra as Product;
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: DetailsScreen(book: book),
          );
        },
      ),
      GoRoute(
        path: placeOrder,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => CartCubit()..prefillOrderData(),
            child: PlaceOrderScreen(total: state.extra as String),
          );
        },
      ),
    ],
  );
}
