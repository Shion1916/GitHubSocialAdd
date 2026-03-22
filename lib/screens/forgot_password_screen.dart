import 'package:flutter/material.dart';
import 'package:social_media_app/screens/register_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Logic variables
  bool _isOtpCorrect = false;
  final String _sampleOtpCode = "123456"; // Your inline sample OTP
  final TextEditingController _otpController = TextEditingController();

  void _verifyOtp() {
    if (_otpController.text == _sampleOtpCode) {
      setState(() {
        _isOtpCorrect = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP! Try 123456")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff08efc), Color(0xffee5166)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "VibeLy",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontFamily: "Billabong",
                    ),
                  ),
                  const Text(
                    "Reset Your Password",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email Field
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x66b8b4b4),
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 15),

                  // OTP Field
                  TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x66b8b4b4),
                      hintText: "Otp Code (Hint: 123456)",
                      hintStyle: const TextStyle(color: Colors.white38, fontSize: 12),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.check_circle, color: Colors.blue),
                        onPressed: _verifyOtp,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),

                  if (_isOtpCorrect) ...[
                    const SizedBox(height: 15),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 15),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0x66b8b4b4),
                        hintText: "New Password",
                        hintStyle: const TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 15),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0x66b8b4b4),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isOtpCorrect ? () {
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isOtpCorrect ? Colors.blue : Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Confirm Changes", style: TextStyle(color: Colors.white)),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Back to Login", style: TextStyle(color: Colors.white60)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}