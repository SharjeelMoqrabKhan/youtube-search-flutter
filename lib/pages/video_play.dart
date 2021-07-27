import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_search_flutter/model/item_data.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({Key key, this.items}) : super(key: key);
  final ItemData items;
  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.items.id.videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        forceHD: false,
        loop: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _youtubePlayerController,
                progressIndicatorColor: Colors.red,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${widget.items.snippet.title}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${widget.items.snippet.description}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
