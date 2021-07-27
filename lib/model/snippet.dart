import 'package:youtube_search_flutter/model/thumbnail.dart';

class Snippet {
  Snippet(
      {this.publishedAt,
      this.channelId,
      this.title,
      this.description,
      this.thumbnail});
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final Thumbnail thumbnail;
  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      publishedAt: json['publishedAt'],
      channelId: json['channelId'],
      title: json['title'],
      description: json['description'],
      thumbnail: Thumbnail.fromJson(json['thumbnails']),
    );
  }
}
