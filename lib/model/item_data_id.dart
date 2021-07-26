class ItemDataId {
  ItemDataId({this.kind, this.channelId});
  final String kind;
  final channelId;

  factory ItemDataId.fromJson(Map<String, dynamic> json) {
    return ItemDataId(kind: json['kind'], channelId: json['channelId']);
  }
}
