import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/colores.dart';
import 'package:youtube_clone/styles/textstyles.dart';
import 'package:youtube_clone/viewmodel/category_viewmodel.dart';

import '../../model/category.dart';

class ViewTabCategory extends StatefulWidget {
  const ViewTabCategory({super.key});

  @override
  State<ViewTabCategory> createState() => _ViewTabCategoryState();
}

class _ViewTabCategoryState extends State<ViewTabCategory> {
  List<Category> categories = [];
  int _categorySelected = 0;

  @override
  void initState() {
    super.initState();
    // Assuma que a função get_all_category() retorna uma lista de categorias
    categories = Category_ViewModel().get_all_category();
  }

  void _selectCategory(int index) {
    setState(() {
      _categorySelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            final category = categories[index];
            final isSelected = _categorySelected == index;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: isSelected
                    ? my_grey400
                    : my_grey850, // Destaque a categoria selecionada
                elevation: 0,
                minWidth: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  _selectCategory(index); // Atualiza a categoria selecionada
                },
                child: category.name != null
                    ? Text(category.name!,
                        style: isSelected
                            ? grey850_normal_text14
                            : white_normal_text14)
                    : Icon(
                        category.icon,
                        color: isSelected ? my_grey850 : my_white100,
                      ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
