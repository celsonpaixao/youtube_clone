import 'package:youtube_clone/model/category.dart';

abstract class CategoryState {
  final List<Category> categories;

  CategoryState({required this.categories});
}

class CategoryInitialState extends CategoryState {
  CategoryInitialState() : super(categories: []);
}

class CategoryLoadingState extends CategoryState {
  CategoryLoadingState() : super(categories: []);
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState({required List<Category> categories})
      : super(categories: categories);
}

class CategoryErrorState extends CategoryState {
  final Exception external;
  CategoryErrorState(String string, {required this.external}) : super(categories: []);
}
