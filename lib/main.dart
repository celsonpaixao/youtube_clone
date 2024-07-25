import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/colores.dart';

import 'package:youtube_clone/view/router_nav_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: my_red650),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: RouterNavPage(),
    );
  }
}
