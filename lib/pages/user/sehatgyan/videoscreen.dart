import 'package:firebasetut/pages/user/sehatgyan/playvideo.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Divider(color: Colors.brown[50]),
            Expanded(
              child: Container(
                child: PlayVideo(
                  videoid: "3Xb3g6IPQkM",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
