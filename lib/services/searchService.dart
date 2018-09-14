import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:image_search/appConfiguration.dart';
import 'package:image_search/models/apiResponse.dart';
import 'package:image_search/models/image.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class SearchService {
  final baseUrl = AppConfiguration.API_BASE_URL;
  Dio dio = new Dio();
  static final SearchService _searchService = new SearchService._internal();

  static SearchService get() {
    return _searchService;
  }

  SearchService._internal();

  Future<List<Image>> searchImage(String query) async {
    String url = this.baseUrl + "search/$query";
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      // Map theMap = json.decode(response.data.toString());

      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      List<Image> imageList = createImageList(apiResponse);
      return imageList;
    } else {
      throw Exception('Failed to load the news ');
    }
  }

  List<Image> createImageList(ApiResponse data) {
    List<Image> images = new List();
    for (int i = 0; i < data.results.length; i++) {
      var temp = Image.fromJson((data.results[i]));
      images.add(temp);
    }
    return images;
  }
}
