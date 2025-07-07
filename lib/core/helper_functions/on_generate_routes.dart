import 'package:fashion/features/auth/presentation/views/login_view.dart';
import 'package:fashion/features/auth/presentation/views/sign_up_view.dart';
import 'package:fashion/features/home/presentation/views/home_view.dart';
import 'package:fashion/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
