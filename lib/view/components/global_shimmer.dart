import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_clone/styles/colores.dart';

class GlobalShimmer extends StatelessWidget {
  const GlobalShimmer({
    super.key,
    required this.itemCont,
    required this.direction,
    required this.width,
    required this.height,
    required this.padding,
    required this.bordervalue,
  });
  final int itemCont;
  final double width;
  final double height;
  final Axis direction;
  final EdgeInsets padding;
  final double bordervalue;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCont,
      scrollDirection: direction,
      separatorBuilder: (context, index) => Padding(padding: padding),
      itemBuilder: (_, index) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: my_grey700,
              borderRadius: BorderRadius.circular(bordervalue)),
        );
      },
    );
  }
}
