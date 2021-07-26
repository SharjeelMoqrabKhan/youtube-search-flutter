import 'package:youtube_search_flutter/model/item_data.dart';
import 'package:youtube_search_flutter/model/page_info.dart';

class YoutubeSearchModel {
  YoutubeSearchModel(
      {this.kind,
      this.etag,
      this.nextPageToken,
      this.regionCode,
      this.pageInfo,
      this.items});
  final String kind;
  final String etag;
  final String nextPageToken;
  final String regionCode;
  final PageInfo pageInfo;
  final List<ItemData> items;
  factory YoutubeSearchModel.fromJson(Map<String, dynamic> json) {
    final items = json['items'] as List;
    List<ItemData> itemData = items.map((e) => ItemData.fromJson(e)).toList();
    return YoutubeSearchModel(
      kind: json['kind'],
      etag: json['etag'],
      nextPageToken: json['nextPageToken'],
      regionCode: json['regionCode'],
      pageInfo: PageInfo.fromJson(
        json['pageInfo'],
      ),
      items: itemData,
    );
  }
}
