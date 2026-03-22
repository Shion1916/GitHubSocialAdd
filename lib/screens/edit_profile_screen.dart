import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  bool obscure1 = true;
  bool obscure2 = true;
  bool obscure3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// PROFILE PHOTO
          const Center(
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=3",
              ),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text("Change Profile Photo"),
          ),

          const SizedBox(height: 20),

          /// PROFILE INFO
          const TextField(
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          const TextField(
            decoration: InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Bio",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 30),

          /// PASSWORD SECTION
          const Text(
            "Change Password",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            obscureText: obscure1,
            decoration: InputDecoration(
              labelText: "Current Password",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure1 ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obscure1 = !obscure1;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            obscureText: obscure2,
            decoration: InputDecoration(
              labelText: "New Password",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure2 ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obscure2 = !obscure2;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            obscureText: obscure3,
            decoration: InputDecoration(
              labelText: "Confirm New Password",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure3 ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obscure3 = !obscure3;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 25),

          /// SAVE BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Save Changes"),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}