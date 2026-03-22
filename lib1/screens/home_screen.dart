import 'package:flutter/material.dart';
import '../widgets/menu_widget.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainFeedScreen();
  }
}

class MainFeedScreen extends StatefulWidget {
  const MainFeedScreen({super.key});

  @override
  State<MainFeedScreen> createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> {
  int selectedSidebar = 0;

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
      avatar: "https://picsum.photos/seed/post5/500/300",
      postImage: "https://picsum.photos/seed/post5/500/300",
    ),
  ];

  Future<void> refreshFeed() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  void toggleLike(int index) {
    setState(() {
      users[index].isLiked = !users[index].isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MenuWidget(
            selectedIndex: selectedSidebar,
            users: users,
            onItemSelected: (index) {
              setState(() {
                selectedSidebar = index;
              });
            },
          ),
          Expanded(child: buildMainContent()),
        ],
      ),
    );
  }

  Widget buildMainContent() {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: refreshFeed,
          child: ListView(
            children: [
              buildStories(),
              const Divider(color: Colors.white12),
              buildFeed(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final user = users[index];

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(user.avatar),
                ),
                const SizedBox(height: 4),
                Text(
                  user.name,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildFeed() {
    return ListView.builder(
      itemCount: users.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "This UI blends Discord sidebar, Instagram stories, and X feed."),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(user.postImage),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.chat_bubble_outline,
                            size: 18, color: Colors.grey),
                        const Icon(Icons.repeat,
                            size: 18, color: Colors.grey),

                        GestureDetector(
                          onTap: () => toggleLike(index),
                          child: Icon(
                            user.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: user.isLiked
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),

                        const Icon(Icons.share_outlined,
                            size: 18, color: Colors.grey),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}