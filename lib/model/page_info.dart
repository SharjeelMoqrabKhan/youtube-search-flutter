class PageInfo {
  PageInfo({this.totalResults, this.resultsPerPage});
  final int totalResults;
  final int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
        totalResults: json['totalResults'],
        resultsPerPage: json['resultsPerPage']);
  }
}
