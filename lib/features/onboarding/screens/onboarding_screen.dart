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
    backgroundImage: AppConstants.backgroundImage1,
  ),
  OnboardingPage(
    imagePath: AppConstants.delivery_2,
    title: 'Delivered to Your Door',
    description:
        'Get your favorite items delivered quickly and safely—right to your doorstep. Experience convenience and reliability every time you shop!',
    backgroundImage: AppConstants.backgroundImage1,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // White background for onboarding
      body: SafeArea(
        // Ensures content is not obscured by system UI (notch, status bar)
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppConstants.backgroundImage1),
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingPages.length,
                  itemBuilder: (context, index) {
                    final page = onboardingPages[index];
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            page.imagePath,
                            height:
                                MediaQuery.of(context).size.height *
                                0.4, // Responsive image size
                          ),
                          const SizedBox(height: 40),
                          Text(
                            page.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary, // Primary text color
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            page.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color:
                                  AppColors.textSecondary, // Secondary text color
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Page Indicator (Dots)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingPages.length,
                  (index) => buildDot(index, _currentPage),
                ),
              ),
              const SizedBox(height: 30),
              // Navigation Buttons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentPage <
                        onboardingPages.length -
                            1) // Show Skip button if not last page
                      TextButton(
                        onPressed: () {
                          // Navigate directly to the login/home screen
                          _navigateToAuthOrHome();
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                AppColors.textSecondary, // Secondary text color
                          ),
                        ),
                      ),
                    const Spacer(), // Pushes buttons to ends
                    ElevatedButton(
                      onPressed: () {
                        if (_currentPage < onboardingPages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          // This is the last page, navigate to the next flow
                          _navigateToAuthOrHome();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColor, // Primary button color
                        foregroundColor: AppColors.white, // White text on button
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        _currentPage == onboardingPages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the page indicator dots
  Widget buildDot(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.primaryColor : AppColors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  void _navigateToAuthOrHome() {
    // In a real app, you'd check if the user is already logged in.
    // For now, let's navigate to a placeholder for the login screen or home screen.
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // builder: (context) => const PlaceholderScreen(
          //   title: 'Authentication/Home Screen',
          // ), // Placeholder for now
          // In a real app, this would be:
          builder: (context) => const LoginScreen(),
          // OR if already logged in:
          // builder: (context) => const HomeScreen(),
        ),
      );
    }
  }
}

// Placeholder for the next screen (e.g., LoginScreen or HomeScreen)
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Welcome to the $title!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
