class Category {
  String? id;
  String? title;
  String? urlImage;
  String? createAt;

  Category({this.id, this.title, this.urlImage, this.createAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    urlImage = json['url_image'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url_image'] = this.urlImage;
    data['create_at'] = this.createAt;
    return data;
  }
}
