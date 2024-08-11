import 'package:flutter/material.dart';
import 'package:youtube_clone/interfaces/icategory.dart';
import 'package:youtube_clone/model/category.dart';

class CategoryRepository implements ICategory {
  final List<Category> _list_categorys = [];
  @override
  Future<List<Category>> get_all_category() {
    _list_categorys.addAll([
      Category(icon: Icons.explore_outlined),
      Category(name: "All"),
      Category(name: "Under 10 min"),
      Category(name: "Music"),
      Category(name: "Food"),
      Category(name: "Manga"),
      Category(name: "Movie"),
    ]);
    return Future.delayed(
      const Duration(seconds: 2),
      () => _list_categorys,
    );
  }
}
