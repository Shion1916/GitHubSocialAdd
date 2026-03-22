import 'package:flutter/material.dart';

class DiscordSidebar extends StatelessWidget {
  final int selectedIndex;
  final List<String> userAvatars;
  final Function(int) onItemSelected;

  const DiscordSidebar({
    super.key,
    required this.selectedIndex,
    required this.userAvatars,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 72,
      backgroundColor: const Color(0xFF1E1F22),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildIcon(0, icon: Icons.home_filled),
          _buildIcon(1, icon: Icons.person),
          _buildIcon(2, icon: Icons.search),
          _buildIcon(3, icon: Icons.movie_outlined),
          _buildIcon(4, icon: Icons.notifications_none),
          const Divider(indent: 20, endIndent: 20, color: Colors.white10),
          _buildIcon(5, icon: Icons.add),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: userAvatars.length,
              itemBuilder: (context, index) {
                return _buildIcon(index + 6, imageUrl: userAvatars[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(int index, {IconData? icon, String? imageUrl}) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5865F2) : const Color(0xFF313338),
          borderRadius: BorderRadius.circular(isSelected ? 14 : 24),
          image: imageUrl != null
              ? DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
              : null,
        ),
        child: icon != null
            ? Icon(icon, color: isSelected ? Colors.white : Colors.grey)
            : null,
      ),
    );
  }
}