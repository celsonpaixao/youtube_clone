import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube_clone/model/category.dart';
import 'package:youtube_clone/resources/app_constats.dart';

abstract class ICategory {
  Future<List<Category>> get_all_category();
}

class CategoryRepository implements ICategory {
  @override
  
  Future<List<Category>> get_all_category() async {
    var url = Uri.parse(
      "${baseUrl}v3/videoCategories?part=snippet&regionCode=$regionCode&key=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)["items"];
      return body.map((dynamic item) => Category.fromMap(item)).toList();
    } else {
      throw Exception("Category not found!!");
    }
  }
}
