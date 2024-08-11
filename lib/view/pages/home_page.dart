import 'package:flutter/material.dart';
import 'package:youtube_clone/view/components/global_appbar.dart';
import 'package:youtube_clone/view/components/global_icon_button.dart';
import 'package:youtube_clone/view/components/global_user_avatar.dart';
import 'package:youtube_clone/view/components/layout_page.dart';
import 'package:youtube_clone/view/components/view_tab_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      page: Scaffold(
        appBar: GlobalAppBar( showcategory: true,),
        body: Column(
          children: [
            // Adicione widgets ou um Container para exibir conteúdo
          ],
        ),
       
      ),
    );
  }
}

