import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/features/auth/presentation/views/login_view.dart';
import 'package:fashion/features/auth/presentation/views/sign_up_view.dart';
import 'package:fashion/features/check_out/presentation/views/address_view.dart';
import 'package:fashion/features/check_out/presentation/views/check_out_view.dart';
import 'package:fashion/features/home/presentation/views/all_product_view.dart';
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
    case AllProductView.routeName:
      return MaterialPageRoute(builder: (_) => const AllProductView());
    case AddressView.routeName:
      return MaterialPageRoute(builder: (_) => const AddressView());
    case CheckOutView.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            CheckOutView(product: settings.arguments as ProductEntity),
      );
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
