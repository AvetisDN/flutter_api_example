import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<Post> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

String allPostsToJson(List<Post> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
