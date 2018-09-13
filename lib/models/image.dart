import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  String url;
  int width;
  int height;

  Image({
    this.url,
    this.width,
    this.height,
  });

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["url"] = url;
    map["width"] = width;
    map["height"] = height;

    return map;
  }

  static fromMap(Map map) {
    Image image = new Image();
    image.url = map["url"];
    image.width = map["width"];
    image.height = map["height"];
    return image;
  }

  static final columns = ["url", "width", "height"];

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
