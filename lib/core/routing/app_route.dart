import 'package:flutter/material.dart';
import 'package:flutter_application/core/di/dependency_injection.dart';
import 'package:flutter_application/core/routing/routes.dart';
import 'package:flutter_application/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flutter_application/features/auth/ui/forget_password_screen.dart';
import 'package:flutter_application/features/auth/ui/login_screen.dart';
import 'package:flutter_application/features/auth/ui/register_screen.dart';
import 'package:flutter_application/features/home/logic/home_cubit.dart';
import 'package:flutter_application/features/home/ui/home_screen.dart';
import 'package:flutter_application/features/layout/ui/layout_screen.dart';
import 'package:flutter_application/features/onBoarding/onBoarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: RegisterScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.layout:
        return MaterialPageRoute(
          builder: (context) => LayoutScreen(),
        );
      // case Routes.home:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => HomeCubit(getIt())..getSpecializations(),
      //       child: const HomeScreen(),
      //     ),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}
