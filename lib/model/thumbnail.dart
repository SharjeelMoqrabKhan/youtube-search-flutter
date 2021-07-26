import 'package:youtube_search_flutter/model/thumbnail_data.dart';

class Thumbnail{
  Thumbnail({this.medium, this.high});
  final ThumbnailData medium;
  final ThumbnailData high;
  factory Thumbnail.fromJson(Map<String,dynamic>json){
    return Thumbnail(
      high: ThumbnailData.fromJson(json['high']),
      medium: ThumbnailData.fromJson(json['medium']),
    );
  }
}