import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/core/constants/app_constants.dart';
import 'package:urmallng_mob_app_v1/features/onboarding/screens/onboarding_screen.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // 1. AnimationController to manage the animation
  late AnimationController _animationController;
  // 2. Animation<double> for the scale effect
  late Animation<double> _scaleAnimation;
  // 3. Animation<double> for the fade effect
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this, // 'this' refers to the SingleTickerProviderStateMixin
      duration: const Duration(
        milliseconds: 1500,
      ), // Animation duration (e.g., 1.5 seconds)
    );
    // Initialize the scale animation: starts small, grows to normal size
    _scaleAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut, // A bouncy, elastic effect for scale
      ),
    );
    // Initialize the fade animation: starts invisible, fades in
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn, // A smooth ease-in effect for fade
      ),
    );
    // Start the animation
    _animationController.forward();

    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Simulate some loading or initialization time
    await Future.delayed(
      _animationController.duration! + const Duration(milliseconds: 4000),
    ); // Total delay: 1.5s animation + 0.5s pause = 2s

    // Navigate to the OnboardingScreen
    // We use pushReplacement to prevent going back to the splash screen
    if (mounted) {
      // Check if the widget is still in the widget tree
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  @override
  void dispose() {
    _animationController
        .dispose(); // Dispose the animation controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(
                      AppConstants.appLogoPinkPath, // Path to your logo image
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Positioned LinearProgressIndicator at the bottom
          Positioned(
            bottom: 40, // Position it at the bottom edge
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              // Use AnimatedBuilder to rebuild just the progress indicator
              animation: _animationController,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: _animationController.value, // Value from 0.0 to 1.0
                  backgroundColor: AppColors.white.withOpacity(
                    0.3,
                  ), // Background color of the bar
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primaryColor,
                  ), // Color of the progress
                  minHeight: 3.0, // Make it thin
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
