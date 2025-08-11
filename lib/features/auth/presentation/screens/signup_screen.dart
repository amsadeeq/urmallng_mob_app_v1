import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/core/constants/app_constants.dart';
import 'package:urmallng_mob_app_v1/features/auth/presentation/screens/login_screen.dart';
import 'package:urmallng_mob_app_v1/shared/routes/slide_route.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVissible = false;
  bool _isConfirmPasswordVissible = false;
  bool _isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      setState(() {
        _isLoading = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signing up...'),
          backgroundColor: AppColors.successGreen,
        ),
      );
      // Simulate a login delay
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //     builder: (context) => const HomeScreen(),
          //   ),
          // );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Signing up successful for ${_emailController.text}',
              ),
            ),
          );
          _emailController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();

          setState(() {
            _isLoading = false;
          });
          print('Signing up successful for: ${_emailController.text}');
        }
      });
      // Navigate to the next screen or show success message
    } else {
      // Show validation errors

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please check your input details'),
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppConstants.appLogoPinkPath,
                  height: 70, // Example height
                ),
                const SizedBox(height: 20),
                Text(
                  'Create an Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 94, 94, 94),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Hi! Let\'s create your account',
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
                const SizedBox(height: 10),
                const Text(
                  '- Password must be at least 8 characters',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                const Text(
                  '- numbers, letters and special characters',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_isConfirmPasswordVissible,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: AppColors.textPrimary),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    labelText: 'Confirm Password',
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
                          _isConfirmPasswordVissible =
                              !_isConfirmPasswordVissible;
                        });
                      },
                      icon: Icon(
                        _isConfirmPasswordVissible
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
                    if (value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // ----------------------------------------------------------------
                // Login Button
                // ----------------------------------------------------------------
                ElevatedButton(
                  onPressed: () {
                    _isLoading ? null : _signup();
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
                          'Sign Up',
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
                      'Already have an account? ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          SlideRoute(
                            page: const LoginScreen(),
                            beginOffset: const Offset(-1.0, 0.0),
                          ),
                        ); // Navigate to Login screen
                      },
                      child: const Text(
                        'Login',
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
