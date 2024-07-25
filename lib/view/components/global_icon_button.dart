import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/colores.dart';

class global_Icon_Button extends StatelessWidget {
  const global_Icon_Button({
    super.key,
    required this.icon,
    required this.onclick,
  });
  final IconData icon;
  final Function() onclick;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 30,
      height: 30,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: my_white100,
        size: 25,
      ),
      onPressed: onclick,
    );
  }
}
