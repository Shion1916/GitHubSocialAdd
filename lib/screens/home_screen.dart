import 'package:flutter/material.dart';
import 'package:social_media_app/screens/profile_screen.dart';
import 'profile_screen.dart';
import '../widgets/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainFeedScreen();
  }
}

class UserModel {
  final String name;
  final String avatar;
  final String postImage;

  UserModel({
    required this.name,
    required this.avatar,
    required this.postImage,
  });
}

class MainFeedScreen extends StatefulWidget {
  const MainFeedScreen({super.key});

  @override
  State<MainFeedScreen> createState() => _MainFeedScreenState();
}


class _MainFeedScreenState extends State<MainFeedScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedCategory = 0;

  final List<UserModel> users = [
    UserModel(
      name: "John Doe",
      avatar: "https://api.dicebear.com/7.x/avataaars/png?seed=John",
      postImage: "https://picsum.photos/seed/post1/500/300",
    ),
    UserModel(
      name: "Jane Smith",
      avatar: "https://api.dicebear.com/7.x/avataaars/png?seed=Jane",
      postImage: "https://picsum.photos/seed/post2/500/300",
    ),
    UserModel(
      name: "Alex Rivera",
      avatar: "https://api.dicebear.com/7.x/avataaars/png?seed=Alex",
      postImage: "https://picsum.photos/seed/post3/500/300",
    ),
    UserModel(
      name: "Sarah Chen",
      avatar: "https://api.dicebear.com/7.x/avataaars/png?seed=Sarah",
      postImage: "https://picsum.photos/seed/post4/500/300",
    ),
    UserModel(
      name: "Mike Ross",
      avatar: "https://api.dicebear.com/7.x/avataaars/png?seed=Mike",
      postImage: "https://picsum.photos/seed/post5/500/300",
    ),
  ];

  void _handleSidebarTap(int index) {
    setState(() {
      _selectedCategory = index;
    });

    // Close the drawer after selection
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.pop(context);
    }

    if (index == 1 || index >= 6) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      floatingActionButton: FloatingActionButton(
        onPressed: _showCreatePostSheet,
        backgroundColor: const Color(0xFF5865F2),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      drawer: DiscordSidebar(
        selectedIndex: _selectedCategory,
        userAvatars: users.map((u) => u.avatar).toList(),
        onItemSelected: _handleSidebarTap,
      ),

      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // 4. Update the onPressed to open the drawer
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
            backgroundColor: Colors.black.withOpacity(0.8),
            elevation: 0,
            title: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async => await Future.delayed(const Duration(seconds: 1)),
            child: ListView(
              children: [
                _buildStorySection(),
                const Divider(color: Colors.white12, height: 1),
                _buildFeedSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildStorySection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length + 1,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFF2B2D31),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage('https://api.dicebear.com/7.x/avataaars/png?seed=myself'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF5865F2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const Icon(Icons.add, size: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Your Story",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // Otherwise, show the regular users (adjusted index by -1)
          final user = users[index - 1];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.orange],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                  ),
                ),
                Text(
                  user.name,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeedSection() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: users.length,
      separatorBuilder: (context, index) =>
      const Divider(color: Colors.white10),
      itemBuilder: (context, index) {
        final user = users[index];

        return Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.name}  •",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "This UI blends Discord's sidebar, Instagram's stories, and X's feed layout.",
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(user.postImage),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.chat_bubble_outline,
                            size: 18, color: Colors.grey),
                        Icon(Icons.repeat,
                            size: 18, color: Colors.grey),
                        Icon(Icons.favorite_border,
                            size: 18, color: Colors.grey),
                        Icon(Icons.share_outlined,
                            size: 18, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCreatePostSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to move up with the keyboard
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Color(0xFF2B2D31), // Discord-style dark grey
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Text(
              "Create Post",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5865F2), // Discord Blue
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Post", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}