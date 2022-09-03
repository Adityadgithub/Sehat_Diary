// Following code is responsible to Play Youtube Video with respective Video ID.

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter_quill/youtube_player_flutter_quill.dart';

class PlayVideo extends StatefulWidget {
  var videoid;
  PlayVideo({this.videoid});
  @override
  _PlayVideoState createState() => _PlayVideoState(videoid: videoid);
}

var videoidd;
var title;
var description;

class _PlayVideoState extends State<PlayVideo> {
  var videoid;

  bool drop = false;

  _PlayVideoState({this.videoid});
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoidd,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        useHybridComposition: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {},
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {},
      ),
      builder: (context, player) => Scaffold(
        body: ListView(
          children: [
            player,
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(38, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (drop == false) {
                              setState(() {});
                              drop = true;
                            } else {
                              setState(() {});
                              drop = false;
                            }
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.77,
                                child: Text(
                                  "15 Min Daily Yoga Routine for Beginners (Follow Along)",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              if (drop == false)
                                Icon(Icons.arrow_drop_down_sharp),
                              if (drop == true)
                                Icon(Icons.arrow_drop_up_outlined),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("by - Fit Tuber"),
                        if (drop == true)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Description: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  '''15 Minute Daily Yoga Routine for Beginners (Follow Along) 

Buy ARATA's New Plant Based Grooming Products - https://www.arata.in/collections/fitt...
(Special Discount Coupon Code FITTUBER30 and get 30% OFF)
Buy ARATA Products from Amazon - https://amzn.to/2U5gKJl

This is a 15 minute beginner’s daily yoga routine. With gyms and offices shutting down, this video is focussed on utilising our precious time into a higher purpose of learning yoga. If you have never practised any of the yogic postures or breathing exercises then this should be the video which will help you get started with this divine practice. Let’s not focus on the fear, panic and the noise created by the media instead channelise our energy into something like yoga which will boost your immunity and help you live a disease free life in the long run. One more thing, this is not a video to just watch but to follow along. So, c’mon let us do it together.

0:47 - Before getting started with this Yoga Routine, do this.
01:12 - Yoga Warm up. These have been referred to as Sukshama Vyayama in the Yogic scriptures
04:15 - Suryanamaskar.The sun salutation. A powerful yogic practice involving 12 asanas.
05:35 - The three most important asanas for our modern lifestyles
05:44 - Pawanmuktasana. The gas release pose. Best to beat acidity and gas issues.
07:20 - Markatasana. The monkey pose. This is especially for the back and the issues related to the spine.
08:22 - Naukaasana. The Boat pose. This is to reduce the belly ponch and tone the abdominal muscles.
09:08 - Yogic pranayama or the breathing exercises.
09:20 - Aum chanting. Thrice. Aum chanting creates subtle vibrations within the body that makes the body ready for pranayama.
10:23 - Bhastrika pranayama or yogic deep breathing. This is a simple yet effective way to boost the immunity. It energises the body and calms the mind.
11:30 - Kapalbhati or rapid exhalation. Among the most powerful Yogic pranayama. It pushes the excessive air trapped in the digestive tract. 
13:29 - Agnisaar. The benefits of agnisaar kriya increase manifold when it's done just after Kapalbhati. It is known to strengthen the digestive system.
14:09 - Anulom Vilom pranayama or Alternate Nostril Breathing. Anulom vilom instantly calms the mind. It has the capability to put in a trance state. You feel mediative.
16:17 - Bhramari Pranayama or Bee breath. This is the best breathing exercise for brain. Stress, anxiety, depression, insomnia, anger issues, weak concentration power,  you name it, Bharamari has the power to cure any issues related to the brain. It even stimulates the pineal and pituitary glands.
17:43 - Rubbing the hands together before concluding. It activates the acupressure points.
17:50 - Last but not the least. Shavasana, to cool down the body.

✅  SUPPORT MY WORK and get exclusive perks 
https://www.youtube.com/channel/UCYC6...

INSTAGRAM :  Follow and participate in Q&A session every Saturday at 11 AM 
https://www.instagram.com/fittuber

18:51 - Video Partner - ARATA. Arata is an Indian brand which has come with it's new range of Plant based non toxic grooming products for both men and women
Buy ARATA's New Plant Based Grooming Products - https://www.arata.in/collections/fitt...
(Special Discount Coupon Code FITTUBER30 and get 30% OFF)
Buy ARATA Products from Amazon - https://amzn.to/2U5gKJl

FOODS & PRODUCTS RELATED TO THE VIDEO
Yoga Mat (Cotton) - https://amzn.to/2J4Uedk
Yoga Mat (Regular) - https://amzn.to/2xecwWO
Semi Brown Rice - https://amzn.to/2sL4539
A2 Cow Ghee - https://amzn.to/2rWbEnN
Amul Ghee - https://amzn.to/2Z7eYZc
Rock Salt - https://amzn.to/36PKMUY
Cumin Seeds - https://amzn.to/38TVUCp
Whole Garam Masala - https://amzn.to/2Q2NtvW
Soya Chunks - https://amzn.to/2Md5Ih5
Multigrain flour for Roti - https://amzn.to/2SaZC4z
Whole Wheat Flour for Dhokli - https://amzn.to/2MfpLv6
Gram Flour for Dhokli - https://amzn.to/34IoFOQ
Mix Dal for Dhokli - https://amzn.to/2ZiTmcF
Kodo Millet - https://amzn.to/36RMaXi
Whole Moong Dal - https://amzn.to/2Q5F3nu
Brass Kadhai - https://amzn.to/2R48zfV
Clay Pot - https://amzn.to/2Sc0LIV

BEST PRODUCTS FROM WORST TO BEST SERIES (My Recommendations) (NOT SPONSORED)
Best Shampoo - https://amzn.to/2JOFON2
Best Face wash - http://amzn.to/2FKXqsd
Best Deodorant - https://amzn.to/2qJ2R4M
Best Sunscreen - http://amzn.to/2DdMgJw
Best Face Cream - https://amzn.to/2J4eVF4
Best Breakfast - https://amzn.to/2KADtWk
Best Instant Noodles - https://amzn.to/2GO0Jhd
Best Biscuits - https://amzn.to/2HRv1B7

MY GEAR
Camera - http://amzn.to/2t7uXdv
Mic - http://amzn.to/2oKxLYq

MORE ON FIT TUBER

7 Healthy & Tasty Dinner Ideas for the Week (Vegetarian)..
https://www.youtube.com/watch?v=BEzAS...

The Only Diet Plan That Ayurveda Recommends (Men & Women)
https://www.youtube.com/watch?v=6ZUFT...

Music Credits : YouTube Audio Library 

I wish you good health.
Fit Tuber'''),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (drop == false)
              Padding(
                padding: const EdgeInsets.only(top: 125),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rotate your device",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.screen_rotation_rounded,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "to view in full screen.",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
