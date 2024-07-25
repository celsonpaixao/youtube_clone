import 'package:flutter/material.dart';
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
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.transparent, // Cor de fundo transparente
          elevation: 0, // Remove a sombra
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset("assets/images/type=text and icon.png"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        global_Icon_Button(
                          icon: Icons.cast_outlined,
                          onclick: () {},
                        ),
                        global_Icon_Button(
                          icon: Icons.notifications_none_sharp,
                          onclick: () {},
                        ),
                        global_Icon_Button(
                          icon: Icons.search_outlined,
                          onclick: () {},
                        ),
                        global_user_Avatar(),
                      ],
                    ),
                  ),
                ],
              ),
              ViewTabCategory(),
            ],
          ),
        ),
        body: Column(
          children: [
            // Adicione widgets ou um Container para exibir conteúdo
          ],
        ),
       
      ),
    );
  }
}
