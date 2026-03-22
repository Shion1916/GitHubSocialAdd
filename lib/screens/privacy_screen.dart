import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {

  bool privateAccount = false;
  bool showOnlineStatus = true;
  bool allowMessages = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: ListView(
        children: [

          SwitchListTile(
            title: const Text("Private Account"),
            subtitle: const Text("Only approved followers can see your posts"),
            value: privateAccount,
            onChanged: (value) {
              setState(() {
                privateAccount = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Show Online Status"),
            subtitle: const Text("Others can see when you are active"),
            value: showOnlineStatus,
            onChanged: (value) {
              setState(() {
                showOnlineStatus = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Allow Direct Messages"),
            value: allowMessages,
            onChanged: (value) {
              setState(() {
                allowMessages = value;
              });
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("Blocked Users"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}