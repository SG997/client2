class SessionModel {
  final String commentCount;
  int likeCount;
  final String date;
  final String avatar;
  final String name;
  final String text;
  int id;
  bool isLiked;

  SessionModel({
    required this.commentCount,
    this.likeCount = 0,
    required this.date,
    required this.avatar,
    required this.name,
    required this.text,
    required this.id,
    this.isLiked = false,
  });
}
