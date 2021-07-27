import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube_search_flutter/model/item_data.dart';
import 'package:youtube_search_flutter/model/youtube_serach_model.dart';
import 'package:http/http.dart' as http;

class YouTubeSearch extends StatefulWidget {
  @override
  _YouTubeSearchState createState() => _YouTubeSearchState();
}

class _YouTubeSearchState extends State<YouTubeSearch> {
  int navigatinIndex = 0;
  bool _isSearch = false;
  List<ItemData> items = [];
  bool _isLoading = true;
  String baseUrl = "https://youtube.googleapis.com/youtube/v3/";
  String apiKey = "AIzaSyDSSvJNMt-nWEKg23SU74gCRaTyTlJSfrU";
  TextEditingController _controller = TextEditingController();
  static const String maxResult = "10";
  final httpClient = http.Client();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadMockResponse();
  }

  Future<void> _loadMockResponse() async {
    String url = baseUrl +
        "search?part=snippet&maxResults=$maxResult&q=${_controller.text}&videoType=any&key=$apiKey";
    final encodeFul = Uri.encodeFull(url);
    final res = await httpClient.get(encodeFul);
    setState(() {
      _isLoading = false;
    });
    if (res.statusCode == 200) {
      final data = YoutubeSearchModel.fromJson(json.decode(res.body));
      items = data.items;
    }
  }

  Widget _searchWidget() {
    return Row(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            child: Icon(Icons.arrow_back)),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.black.withOpacity(.2),
              ),
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        _loadMockResponse();
                      },
                      child: Icon(Icons.search),
                    ),
                    hintText: "search Youtube",
                    border: InputBorder.none),
              )),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1), shape: BoxShape.circle),
          child: Icon(Icons.mic),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearch == true
            ? _searchWidget()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 22,
                    child: Image.asset('assets/images/youtube_logo.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (_isSearch == false) {
                            setState(() {
                              _isSearch = true;
                            });
                          }
                        },
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28),
                          ),
                          child: Image.asset('assets/images/profile_pic.jpeg'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: navigatinIndex,
        onTap: (index) {
          setState(() {
            navigatinIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Subscriptions"),
          BottomNavigationBarItem(icon: Icon(Icons.wysiwyg), label: "Libray"),
        ],
      ),
      body: _isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/videoPlay',
                        arguments: items[index]);
                  },
                  child: Container(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.grey,
                            child: Center(
                              child: Image.network(
                                items[index].snippet.thumbnail.medium.url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            '${items[index].snippet.title}',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "${items[index].snippet.publishedAt}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
