import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/textstyles.dart';
import 'package:youtube_clone/view/components/global_appbar.dart';
import 'package:youtube_clone/view/components/layout_page.dart';

class Subspage extends StatefulWidget {
  const Subspage({super.key});

  @override
  State<Subspage> createState() => _SubspageState();
}

class _SubspageState extends State<Subspage> {
  @override
  Widget build(BuildContext context) {
    return LayoutPage(
        page: Scaffold(
      appBar: GlobalAppBar(
        showcategory: false,
      ),
        body: Center(
        child: Text(
          "Subs Page",
          style: white_normal_text14,
        ),
      ),

      
    ));
  }
}
