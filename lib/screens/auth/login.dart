import 'package:flutter/material.dart';
import 'package:school_management_frontend/widgets/bottom_navbar.dart';
import 'package:school_management_frontend/widgets/navigation.dart';
import 'package:school_management_frontend/screens/teachers/teacher_dashboard.dart';
import 'package:school_management_frontend/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _schoolCodeController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _schoolCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          /// 🟣 TOP-RIGHT ELLIPSE
          Positioned(
            top: -150,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.curvedBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 300),
                ),
              ),
            ),
          ),

          /// 🟣 BOTTOM-LEFT ELLIPSE
          Positioned(
            bottom: -150,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.curvedBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(300, 300),
                ),
              ),
            ),
          ),

          /// 📱 MAIN CONTENT
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// 👋 WELCOME TEXT
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Sign In Now",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 50),

                      /// 🏫 SCHOOL CODE - UPDATED STYLING
                      _buildLoginTextField(
                        label: "School Code",
                        controller: _schoolCodeController,
                        hintText: "Enter school code",
                      ),

                      const SizedBox(height: 25),

                      /// 📧 EMAIL - UPDATED STYLING
                      _buildLoginTextField(
                        label: "Email",
                        controller: _emailController,
                        hintText: "Enter your email",
                      ),

                      const SizedBox(height: 25),

                      /// 🔒 PASSWORD - UPDATED STYLING
                      _buildLoginPasswordField(),

                      const SizedBox(height: 40),

                      /// 🔘 SIGN IN BUTTON
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12), // Changed to match Admission form
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.green.withOpacity(0.3), // Changed to AppColors.green
                              blurRadius: 8, // Reduced blur
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            print("School Code: ${_schoolCodeController.text}");
                            print("Email: ${_emailController.text}");
                            print("Password: ${_passwordController.text}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BottomNavbar()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green, // Changed to AppColors.green
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Changed to match Admission form
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16), // Added padding like Admission form
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🔗 FORGOT PASSWORD
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TeacherDashboard()),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Login Text Field with Admission Form Styling
  Widget _buildLoginTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label - Updated to match Admission form
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        
        // Text Field Container - Updated to match Admission form
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withOpacity(0.1), // Changed to AppColors.green
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.green.withOpacity(0.3)), // Changed to AppColors.green
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.green.withOpacity(0.3)), // Changed to AppColors.green
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.green, width: 2), // Changed to AppColors.green
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Custom Password Field with Admission Form Styling
  Widget _buildLoginPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label - Updated to match Admission form
        const Text(
          "Password",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        
        // Password Field Container - Updated to match Admission form
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withOpacity(0.1), // Changed to AppColors.green
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Enter your password",
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey[600],
                  size: 22,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.green.withOpacity(0.3)), // Changed to AppColors.green
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.green.withOpacity(0.3)), // Changed to AppColors.green
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.green, width: 2), // Changed to AppColors.green
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}