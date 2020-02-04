class PostsList {
  final List<Posts> posts;

  PostsList({this.posts});

  factory PostsList.fromJson(List<dynamic> parsedJson) {
    List<Posts> posts = new List<Posts>();
    posts = parsedJson.map((i) => Posts.fromJson(i)).toList();

    return new PostsList(posts: posts);
  }
}

class Posts {
  int userId;
  int id;
  String title;
  String body;

  Posts({this.userId, this.id, this.title, this.body});

  Posts.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
