import 'package:youtube_clone/model/category.dart';
import 'package:youtube_clone/repository/category_repository.dart';

class CategoryViewModel {
  final List<Category> _list_categorys = [];
  final CategoryRepository repository = CategoryRepository();

  Future<List<Category>> getCategory() async {
    
    var categorylist = await repository.get_all_category();

    _list_categorys.addAll(categorylist);
    return Future.delayed(
      const Duration(seconds: 2),
      () => _list_categorys,
    );
  }
}
