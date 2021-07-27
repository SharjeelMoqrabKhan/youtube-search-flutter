class ThumbnailData {
  ThumbnailData({this.url, this.width, this.height});
  final String url;
  final width;
  final height;
  factory ThumbnailData.fromJson(Map<String, dynamic> json) {
    return ThumbnailData(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}
