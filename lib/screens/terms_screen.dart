import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1F22), // Discord-style background
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Terms & Conditions"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to SocialApp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              "1. Acceptance of Terms",
              "By accessing or using this application, you agree to be bound by these terms and conditions. If you do not agree, please do not use the service.",
            ),
            _buildSection(
              "2. User Conduct",
              "You agree not to post any content that is illegal, harmful, threatening, abusive, harassing, defamatory, or otherwise objectionable. Respect the community guidelines.",
            ),
            _buildSection(
              "3. Privacy Policy",
              "Your privacy is important to us. We collect minimal data to provide the service. Please review our full privacy policy for more details.",
            ),
            _buildSection(
              "4. Intellectual Property",
              "All content, logos, and features are the exclusive property of SocialApp. Users retain rights to the content they post but grant us a license to display it.",
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Last Updated: March 2024",
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF5865F2), // Discord Blue
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
