import 'package:flutter/material.dart';
import 'package:youtube_search_flutter/pages/youtube_searach.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: YouTubeSearch(),
    );
  }
}
