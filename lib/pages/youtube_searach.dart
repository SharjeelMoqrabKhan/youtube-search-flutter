import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_search_flutter/model/youtube_serach_model.dart';

class YouTubeSearch extends StatefulWidget {
  @override
  _YouTubeSearchState createState() => _YouTubeSearchState();
}

class _YouTubeSearchState extends State<YouTubeSearch> {
  int navigatinIndex = 0;
  bool _isSearch = false;

  @override
  void initState() {
    super.initState();
    _loadMockResponse();
  }

  Future<void> _loadMockResponse() async {
    final assetData =
        await rootBundle.loadString('assets/api/youtube_serach.json');
    final response = YoutubeSearchModel.fromJson(json.decode(assetData));
    print(response.items[0].snippet.thumbnail.high.url);
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
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "search Youtube", border: InputBorder.none),
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
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                    child: Text('Video Thumbnail'),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Video Title",
                  maxLines: 2,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Channal Title",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
