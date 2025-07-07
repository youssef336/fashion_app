import 'package:fashion/core/services/firebase_auth_service.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/features/auth/presentation/views/login_view.dart';
import 'package:fashion/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Start fade in animation
    _fadeController.forward();

    // Navigate to login after delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _navigateToLogin();
      }
    });
  }

  Future<void> _navigateToLogin() async {
    // Wait for the fade in animation to complete
    await _fadeController.animateTo(1.0);

    if (!mounted) return;

    // Navigate with a custom route that preserves the Hero animation
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 800),
    );

    // Push the route and remove the splash screen from the stack
    if (mounted) {
      bool isLogin = isUserLoggedIn();
      if (isLogin) {
        await Navigator.of(context).pushReplacementNamed(HomeView.routeName);
      }
      await Navigator.of(context).pushReplacement(route);
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Material(
                  color: Colors.transparent,
                  child: Image.asset(Assets.assetsImageLogo, height: 400),
                ),
              ),
              const SizedBox(height: 20),
              const Hero(
                tag: 'text',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    "Fashion Store",
                    style: TextStyle(fontSize: 40, color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
