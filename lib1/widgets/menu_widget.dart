import 'package:flutter/material.dart';
import '../models/user_model.dart';

class MenuWidget extends StatelessWidget {
  final int selectedIndex;
  final List<UserModel> users;
  final Function(int) onItemSelected;

  const MenuWidget({
    super.key,
    required this.selectedIndex,
    required this.users,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      padding: const EdgeInsets.only(top: 40),
      color: const Color(0xFF1E1F22),
      child: Column(
        children: [
          _menuIcon(Icons.home, 0),
          _menuIcon(Icons.person, 1),
          _menuIcon(Icons.search, 2),
          _menuIcon(Icons.movie, 3),
          _menuIcon(Icons.notifications, 4),

          const Divider(color: Colors.white10),

          _menuIcon(Icons.add, 5),

          ...users.asMap().entries.map((entry) {
            int index = entry.key;
            UserModel user = entry.value;

            return _menuAvatar(user.avatar, index + 6);
          })
        ],
      ),
    );
  }

  Widget _menuIcon(IconData icon, int index) {
    bool selected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF5865F2) : const Color(0xFF313338),
          borderRadius: BorderRadius.circular(selected ? 14 : 24),
        ),
        child: Icon(
          icon,
          color: selected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  Widget _menuAvatar(String url, int index) {
    bool selected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(selected ? 14 : 24),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}