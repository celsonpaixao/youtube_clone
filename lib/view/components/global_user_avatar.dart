import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/colores.dart';

class global_user_Avatar extends StatelessWidget {
  const global_user_Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: my_grey800,
    );
  }
}