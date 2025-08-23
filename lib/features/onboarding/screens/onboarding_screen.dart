// lib/features/onboarding/presentation/screens/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/core/constants/app_constants.dart';
import 'package:urmallng_mob_app_v1/features/auth/presentation/screens/login_screen.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

// import 'package:modern_ecommerce_app/features/home/presentation/screens/home_screen.dart'; // Future: Navigate to home screen
// import 'package:modern_ecommerce_app/features/auth/presentation/screens/login_screen.dart'; // Future: Navigate to login screen

// --- OnboardingPage Model (as defined above) ---
class OnboardingPage {
  final String imagePath;
  final String title;
  final String description;
  final String backgroundImage;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.backgroundImage,
  });
}

// --- Onboarding Content Data (as defined above) ---
final List<OnboardingPage> onboardingPages = [
  OnboardingPage(
    imagePath: AppConstants.onboarding_1,
    title: 'Welcome to ${AppConstants.appName}',
    description: 'Discover amazing products and deals at your fingertips.',
    backgroundImage: AppConstants.backgroundImage1,
  ),
  OnboardingPage(
    imagePath: AppConstants.onboarding_2,
    title: 'Fast & Secure Checkout',
    description: 'Enjoy a seamless and secure shopping experience.',
    backgroundImage: AppConstants.backgroundImage2,
  ),
  OnboardingPage(
    imagePath: AppConstants.delivery_2,
    title: 'Delivered to Your Door',
    description:
        'Get your favorite items delivered quickly and safely—right to your doorstep. Experience convenience and reliability every time you shop!',
    backgroundImage: AppConstants.backgroundImage3,
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Optional: Add a listener to update the current page indicator
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the controller to prevent memory leaks
    super.dispose();
  }

  void _onPageChanged(int index) => setState(() {
    _currentPage = index;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // White background for onboarding
      body: Stack(
        children: [
          // Background Image Crossfade
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: Image.asset(
                onboardingPages[_currentPage].backgroundImage,
                key: ValueKey<int>(_currentPage),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity, // Cover the entire screen
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.65), // Semi-transparent overlay
            ),
          ),
          // Page content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingPages.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      final page = onboardingPages[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 48.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              page.title,
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              page.description,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(height: 28),
                            SizedBox(
                              width: 160,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                onPressed: () {
                                  if (index < onboardingPages.length - 1) {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 350,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const LoginScreen(),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  index < onboardingPages.length - 1
                                      ? 'Next'
                                      : 'Get Started',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // page indicator and skip
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(onboardingPages.length, (i) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 6.0),
                            width: _currentPage == i ? 22 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == i
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        }),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder next screen
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Next screen')));
  }
}
