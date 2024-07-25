import 'package:flutter/material.dart';

import '../model/category.dart';

class Category_ViewModel {
  List<Category> get_all_category() {
    return [
      new Category(icon: Icons.explore_outlined),
      new Category(name: "All"),
      new Category(name: "Under 10 min"),
      new Category(name: "Music"),
      new Category(name: "Food"),
      new Category(name: "Manga"),
      new Category(name: "Movie"),
    ];
  }
}
