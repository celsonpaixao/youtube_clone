import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/textstyles.dart';

class ShortsPage extends StatefulWidget {
  const ShortsPage({super.key});

  @override
  State<ShortsPage> createState() => _ShortsPageState();
}

class _ShortsPageState extends State<ShortsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Shorst Page", style: white_normal_text14,),),
    );
  }
}