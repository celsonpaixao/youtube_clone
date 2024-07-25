import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/colores.dart';
import 'package:youtube_clone/view/pages/home_page.dart';
import 'package:youtube_clone/view/pages/library_page.dart';
import 'package:youtube_clone/view/pages/publish_video_page.dart';
import 'package:youtube_clone/view/pages/shorts_page.dart';
import 'package:youtube_clone/view/pages/subs_page.dart';

class RouterNavPage extends StatefulWidget {
  const RouterNavPage({super.key});

  @override
  State<RouterNavPage> createState() => _RouterNavPageState();
}

class _RouterNavPageState extends State<RouterNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ShortsPage(),
    PublishVideoPage(),
    Subspage(),
    LibraryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        color: my_grey900,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home_filled,
                  color: _selectedIndex == 0 ? my_grey400 : my_grey700),
              onPressed: () => _onItemTapped(0),
            ),
            MaterialButton(
              minWidth: 25,
              shape: CircleBorder(),
              child: _selectedIndex == 1
                  ? Image.asset(
                      "assets/icons/short_fill.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset("assets/icons/short_line.png",
                      width: 25, height: 25),
              onPressed: () => _onItemTapped(1),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: my_grey400,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: my_grey400,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                _selectedIndex == 3
                    ? Icons.subscriptions
                    : Icons.subscriptions_outlined,
                color: my_grey400,
              ),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(
                _selectedIndex == 4
                    ? Icons.video_library
                    : Icons.video_library_outlined,
                color: my_grey400,
              ),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
