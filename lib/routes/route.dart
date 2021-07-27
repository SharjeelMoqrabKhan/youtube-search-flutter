import 'package:flutter/material.dart';
import 'package:youtube_search_flutter/model/item_data.dart';
import 'package:youtube_search_flutter/pages/video_play.dart';
import 'package:youtube_search_flutter/pages/youtube_searach.dart';

class OnGenrateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    if (settings.name == "/") {
      return MaterialPageRoute(
        builder: (_) => YouTubeSearch(),
      );
    } else if (settings.name == "/videoPlay") {
      return args is ItemData
          ? MaterialPageRoute(
              builder: (_) => VideoPlay(
                items: args,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text('Invalid Route'),
              ),
              body: Center(
                child: Text('Route was not found'),
              ),
            );
    } else {
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Invalid Route'),
          ),
          body: Center(
            child: Text('Route was not found'),
          ),
        );
      });
    }
  }
}
