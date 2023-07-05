import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerExample extends StatefulWidget {
  const YoutubePlayerExample();

  @override
  State<YoutubePlayerExample> createState() => _YoutubePlayerExampleState();
}

class _YoutubePlayerExampleState extends State<YoutubePlayerExample> {
  final videoUrl = "https://www.youtube.com/watch?v=NIgKvlAYOdU";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Tutorial"),
        backgroundColor: const Color.fromARGB(255, 135, 18, 231),
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 244, 216, 250),
          child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                videoProgressIndicatorColor: Colors.amber,
                progressColors: ProgressColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 400,
                    ),
                    player,
                  ],
                );
              }),
        ),
      ),
    );
  }
}
