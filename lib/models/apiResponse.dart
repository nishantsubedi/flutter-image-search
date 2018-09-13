import 'package:json_annotation/json_annotation.dart';

part 'apiResponse.g.dart';

@JsonSerializable()
class ApiResponse {
  final List<dynamic> images;

  ApiResponse({
      this.images, 
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

}