class Category {
  Category({
    this.key,
    this.title,
    this.urlImage,
    this.createAt,
  });

  String? key;
  String? title;
  String? urlImage;
  String? createAt;

  Category copyWith({
    String? key,
    String? title,
    String? urlImage,
    String? createAt,
  }) =>
      Category(
        key: key ?? this.key,
        title: title ?? this.title,
        urlImage: urlImage ?? this.urlImage,
        createAt: createAt ?? this.createAt,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    key: json["key"],
    title: json["title"],
    urlImage: json["urlImage"],
    createAt: json["createAt"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "title": title,
    "urlImage": urlImage,
    "createAt": createAt,
  };
}
