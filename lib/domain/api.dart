class ApiFormat {
  String title;
  String picture;
  String content;
  String id;

  ApiFormat(this.title, this.picture, this.content, this.id);
  factory ApiFormat.createObj(Map<String, dynamic> json) {
    return ApiFormat(
        json['title'], json['picture'], json['content'], json['id']);
  }
}
