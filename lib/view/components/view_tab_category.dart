import 'package:flutter/material.dart';
import 'package:youtube_clone/data/blocs/category_bloc.dart';
import 'package:youtube_clone/data/events/category_events.dart';
import 'package:youtube_clone/data/state/category_state.dart';
import 'package:youtube_clone/styles/colores.dart';
import 'package:youtube_clone/styles/textstyles.dart';
import 'package:youtube_clone/view/components/global_shimmer.dart';

class ViewTabCategory extends StatefulWidget {
  const ViewTabCategory({super.key});

  @override
  State<ViewTabCategory> createState() => _ViewTabCategoryState();
}

class _ViewTabCategoryState extends State<ViewTabCategory> {
  late final CategoryBloc _categoryBloc;

  int _categorySelected = 0;

  @override
  void initState() {
    super.initState();
    _categoryBloc = CategoryBloc();
    _categoryBloc.inputCategory.add(GetCategorys());
  }

  void _selectCategory(int index) {
    setState(() {
      _categorySelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<CategoryState>(
        stream: _categoryBloc.outputCategory,
        builder: (context, state) {
          if (state.data is CategoryLoadingState) {
            return SizedBox(
              height: 50,
              child: GlobalShimmer(
                itemCont: 10,
                direction: Axis.horizontal,
                width: 140,
                height: 50,
                padding: EdgeInsets.only(right: 10),
                bordervalue: 10,
              ),
            );
          } else if (state.data is CategoryLoadedState) {
            List categories = state.data?.categories ?? [];
            return SingleChildScrollView(
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
                        _selectCategory(
                            index); // Atualiza a categoria selecionada
                      },
                      child: category.title != null
                          ? Text(category.title!,
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
            );
          } else {
            return Center(
              child: Text(
                "Category not found",
                style: grey850_normal_text14,
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _categoryBloc.inputCategory.close();
    super.dispose();
  }
}
