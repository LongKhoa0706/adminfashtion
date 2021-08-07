class SubCategory {
  SubCategory({
    this.key,
    this.title,
    this.createAt,
    this.keyCategoryId,
  });

  String? key;
  String? title;
  String? createAt;
  String? keyCategoryId;

  SubCategory copyWith({
    String? key,
    String? title,
    String? createAt,
    String? keyCategoryId,
  }) =>
      SubCategory(
        key: key ?? this.key,
        title: title ?? this.title,
        createAt: createAt ?? this.createAt,
        keyCategoryId : keyCategoryId ?? this.keyCategoryId,
      );

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    key: json["key"],
    title: json["title"],
    createAt: json["createAt"],
    keyCategoryId: json['keyCategoryId'],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "title": title,
    "createAt": createAt,
    "keyCategoryId":keyCategoryId,
  };
}
