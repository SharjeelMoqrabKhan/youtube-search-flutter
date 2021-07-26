import 'package:youtube_search_flutter/model/item_data_id.dart';
import 'package:youtube_search_flutter/model/snippet.dart';

class ItemData {
  ItemData({this.kind, this.etag, this.id,this.snippet});
  final String kind;
  final String etag;
  final ItemDataId id;
  final Snippet snippet;

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      kind: json['kind'],
      etag: json['etag'],
      id: ItemDataId.fromJson(json['id']),
      snippet: Snippet.fromJson(json['snippet'])
    );
  }
}
