import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/privacy_screen.dart';
import '../screens/terms_screen.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(Widget) navigate;

  const GlobalAppBar({super.key, required this.navigate});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Social Media App"),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case "login":
                navigate(const LoginScreen());
                break;

              case "register":
                navigate(const RegisterScreen());
                break;

              case "forgot":
                navigate(const ForgotPasswordScreen());
                break;

              case "home":
                navigate(const HomeScreen());
                break;

              case "profile":
                navigate(const ProfileScreen());
                break;

              case "settings":
                navigate(const SettingsScreen());
                break;

              case "edit":
                navigate(const EditProfileScreen());
                break;

              case "privacy":
                navigate(const PrivacyScreen());
                break;

              case "terms":
                navigate(const TermsAndConditionsScreen());
                break;

            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: "login", child: Text("Login")),
            PopupMenuItem(value: "register", child: Text("Register")),
            PopupMenuItem(value: "forgot", child: Text("Forgot Password")),
            PopupMenuItem(value: "home", child: Text("Home")),
            PopupMenuItem(value: "profile", child: Text("Profile")),
            PopupMenuItem(value: "settings", child: Text("Settings")),
            PopupMenuItem(value: "edit", child: Text("Edit Profile")),
            PopupMenuItem(value: "privacy", child: Text("Privacy")),
            PopupMenuItem(value: "terms", child: Text("Terms")),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}