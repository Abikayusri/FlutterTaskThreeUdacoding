import 'package:flutter/material.dart';

import '../style/colors/app_colors.dart';
import 'home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGray,
        elevation: 0,
        title: Text(
          "New Account",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.darkGray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 48),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel("Full name"),
                    _buildTextField(hintText: "Enter your full name"),

                    const SizedBox(height: 20),

                    _buildLabel("User name"),
                    _buildTextField(hintText: "Enter your user name"),

                    const SizedBox(height: 20),

                    _buildLabel("Email"),
                    _buildTextField(
                      hintText: "example@example.com",
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 20),

                    _buildLabel("Password"),
                    _buildTextField(
                      hintText: "••••••••••••••",
                      isPassword: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "image/ic_eye_red.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "By continuing, you agree to\n",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: "Terms of Use",
                              style: TextStyle(
                                color: AppColors.primaryOrange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: AppColors.primaryOrange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryOrange,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shadowColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Center(
                      child: Text(
                        "or sign up with",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "Log in",
                                style: TextStyle(
                                  color: AppColors.primaryOrange,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    bool isPassword = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creamButton,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryOrange, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          filled: true,
          fillColor: AppColors.creamButton,
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;

  const PasswordField({Key? key, required this.hintText, this.validator})
    : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creamButton,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        obscureText: !_isVisible,
        validator: widget.validator,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
          suffixIcon: IconButton(
            onPressed: () => setState(() => _isVisible = !_isVisible),
            icon: Icon(
              _isVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryOrange,
              size: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryOrange, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          filled: true,
          fillColor: AppColors.creamButton,
        ),
      ),
    );
  }
}
