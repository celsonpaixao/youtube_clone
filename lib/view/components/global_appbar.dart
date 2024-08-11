import 'package:flutter/material.dart';
import 'package:youtube_clone/view/components/global_icon_button.dart';
import 'package:youtube_clone/view/components/global_user_avatar.dart';
import 'package:youtube_clone/view/components/view_tab_category.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
    super.key,
    required this.showcategory,
  });

  final bool showcategory;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          if (showcategory == true) ViewTabCategory(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showcategory? 110: 50);
}
