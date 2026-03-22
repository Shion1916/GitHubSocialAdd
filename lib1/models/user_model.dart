class UserModel {
  final String name;
  final String avatar;
  final String postImage;
  bool isLiked;

  UserModel({
    required this.name,
    required this.avatar,
    required this.postImage,
    this.isLiked = false,
  });
}