import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/colores.dart';

class LayoutPage extends StatelessWidget {
  final Widget page;
  const LayoutPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: my_grey900
        
      ),
      
      child: page,
    );
  }
}
