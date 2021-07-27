import 'package:flutter/material.dart';
import 'package:youtube_search_flutter/routes/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: OnGenrateRoute.route,
    );
  }
}
