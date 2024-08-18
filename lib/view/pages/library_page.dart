import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/textstyles.dart';
import 'package:youtube_clone/view/components/global_appbar.dart';
import 'package:youtube_clone/view/components/layout_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutPage(
        page: Scaffold(
      appBar: GlobalAppBar(
        showcategory: false,
      ),
      body: Center(
        child: Text(
          "Library Page",
          style: white_normal_text14,
        ),
      ),
    ));
  }
}
