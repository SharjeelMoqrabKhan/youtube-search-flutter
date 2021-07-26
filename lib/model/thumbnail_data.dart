class ThumbnailData {
  ThumbnailData({this.url});
  final String url;

  factory ThumbnailData.fromJson(Map <String,dynamic>json){
    return ThumbnailData(
      url: json['url']
    );
  }
}
