class PostDetails{
  dynamic userId;
  dynamic id;
  dynamic title;
  dynamic body;

  PostDetails({this.userId, this.id, this.title, this.body});

  PostDetails.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    body = json['body'] ?? "";
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
