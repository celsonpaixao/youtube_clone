import 'dart:async';

import 'package:youtube_clone/data/events/category_events.dart';
import 'package:youtube_clone/data/state/category_state.dart';
import 'package:youtube_clone/model/category.dart';
import 'package:youtube_clone/repository/category_repository.dart';

class CategoryBloc {
  final _repository = CategoryRepository();
  
  final StreamController<CategoryEvents> _inputCategoryController =
      StreamController<CategoryEvents>();

  final StreamController<CategoryState> _outputCategoryController =
      StreamController<CategoryState>();

  Sink<CategoryEvents> get inputCategory => _inputCategoryController.sink;
  Stream<CategoryState> get outputCategory => _outputCategoryController.stream;

  CategoryBloc() {
    _inputCategoryController.stream.listen(_mapEventState);
  }

  void _mapEventState(CategoryEvents event) async {
    List<Category> categories = [];

    _outputCategoryController.add(CategoryLoadingState());

    if (event is GetCategorys) {
      categories = await _repository.get_all_category();
    }

    _outputCategoryController.add(CategoryLoadedState(categories: categories));
  }

    void dispose() {
    _inputCategoryController.close();
    _outputCategoryController.close();
  }

}
 