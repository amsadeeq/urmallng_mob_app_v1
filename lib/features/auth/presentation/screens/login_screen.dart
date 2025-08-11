import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/core/constants/app_constants.dart';
import 'package:urmallng_mob_app_v1/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:urmallng_mob_app_v1/features/auth/presentation/screens/signup_screen.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/home_screen.dart';
import 'package:urmallng_mob_app_v1/shared/routes/slide_route.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVissible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here

      setState(() {
        _isLoading = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logging In...'),
          backgroundColor: AppColors.successGreen,
        ),
      );
      // Simulate a login delay
      await Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful for ${_emailController.text}'),
            ),
          );
          _emailController.clear();
          _passwordController.clear();
          setState(() {
            _isLoading = false;
          });
          print('Login successful for: ${_emailController.text}');
        }
      });
      // Navigate to the next screen or show success message
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide details to login'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _loginWithGoogle() {
    // Placeholder for Google login logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Google login not implemented yet'),
        backgroundColor: AppColors.primaryColor,
      ),
    );
    print('Google login tapped');
  }

  void _loginWithApple() {
    // Placeholder for Google login logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Apple login not implemented yet'),
        backgroundColor: AppColors.primaryColor,
      ),
    );
    print('Apple login tapped');
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Use a conditional to set padding and font sizes
    // final horizontalPadding = screenWidth > 600 ? 60.0 : 30.0;
    // final titleFontSize = screenWidth > 600 ? 36.0 : 24.0;
    // final logoHeight = screenWidth > 600 ? 150.0 : 100.0;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Image.asset(
                  AppConstants.appLogoPinkPath,
                  height: 80, // Example height
                ),
                const SizedBox(height: 20),
                Text(
                  'Dear Customer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 94, 94, 94),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Please enter your details to login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 30),
                // ----------------------------------------------------------------
                // Email Input Field
                // ----------------------------------------------------------------
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: AppColors.textPrimary),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 232, 230, 230),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_isPasswordVissible,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: AppColors.textPrimary),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 232, 230, 230),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVissible = !_isPasswordVissible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVissible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.grey,
                        size: 17,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // ----------------------------------------------------------------
                // Forgor Password Link
                // ----------------------------------------------------------------
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        SlideRoute(
                          page: const ForgotPasswordScreen(),
                          beginOffset: const Offset(1.0, 0.0),
                        ),
                      ); // Navigate to Forgot Password screen
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // ----------------------------------------------------------------
                // Login Button
                // ----------------------------------------------------------------
                ElevatedButton(
                  onPressed: () {
                    _isLoading ? null : _login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primaryColor, // Primary button color
                    foregroundColor: AppColors.white, // White text on button
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 9,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.white, // White text for contrast
                          ),
                        ),
                ),
                const SizedBox(height: 15),
                // ----------------------------------------------------------------
                // Alternative Login Options
                // ----------------------------------------------------------------
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: AppColors.grey),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 15),
                // Social Media Login Buttons (Placeholder)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _loginWithGoogle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(
                        Icons.g_mobiledata_rounded,
                        color: AppColors.textPrimary,
                        size: 30,
                      ),
                      label: const Text(
                        'Google',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: _loginWithApple,
                      label: const Text(
                        'Apple',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(
                        Icons.apple,
                        color: AppColors.textPrimary,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          SlideRoute(
                            page: const SignupScreen(),
                            beginOffset: const Offset(1.0, 0.0),
                          ),
                        ); // Navigate to Sign Up screen
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
