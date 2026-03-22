import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool notifications = true;
  bool darkMode = true;

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget tile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),

      body: ListView(
        children: [

          /// PROFILE HEADER
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [

                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),

                const SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("@johndoe"),
                  ],
                )
              ],
            ),
          ),

          const Divider(),

          /// ACCOUNT
          sectionTitle("Account"),

          tile(
            icon: Icons.person,
            title: "Edit Profile",
            onTap: () {},
          ),

          tile(
            icon: Icons.lock,
            title: "Privacy",
            onTap: () {},
          ),

          /// NOTIFICATIONS
          sectionTitle("Notifications"),

          tile(
            icon: Icons.notifications,
            title: "Push Notifications",
            trailing: Switch(
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          /// APP SETTINGS
          sectionTitle("App"),

          tile(
            icon: Icons.dark_mode,
            title: "Dark Mode",
            trailing: Switch(
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),

          tile(
            icon: Icons.help_outline,
            title: "Help & Support",
            onTap: () {},
          ),

          const SizedBox(height: 20),

          /// LOGOUT
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Log Out",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {},
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}