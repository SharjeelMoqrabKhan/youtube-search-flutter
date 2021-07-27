class ItemDataId {
  ItemDataId({this.kind, this.videoId});
  final String kind;
  final videoId;

  factory ItemDataId.fromJson(Map<String, dynamic> json) {
    return ItemDataId(kind: json['kind'], videoId: json['videoId']);
  }
}
