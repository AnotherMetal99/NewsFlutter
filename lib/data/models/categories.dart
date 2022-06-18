class Category {
  int? id;
  String? title;
  String? text;
  DateTime? dateTime;
  String? previewPath;
  String? mainImagePath;
  List<String>? additionalImagesPaths;
  String? language;

  Category(
      {this.id,
      this.title,
      this.text,
      this.dateTime,
      this.previewPath,
      this.mainImagePath,
      this.additionalImagesPaths,
      this.language});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    text = json['Text'];
    dateTime = DateTime.parse(json["DateTime"]);
    previewPath = json['PreviewPath'];
    mainImagePath = json['MainImagePath'];
    if (json['AdditionalImagesPaths'] != null) {
      additionalImagesPaths =
          List<String>.from(json["AdditionalImagesPaths"].map((x) => x));
    }
    language = json['Language'];
  }
}
