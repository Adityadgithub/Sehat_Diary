// Following code is responsible to Display Videos and Blogs
// related to health and fitness.

import 'package:firebasetut/pages/user/sehatgyan/playvideo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SehatGyan extends StatefulWidget {
  const SehatGyan({Key? key}) : super(key: key);

  @override
  State<SehatGyan> createState() => _SehatGyanState();
}

class _SehatGyanState extends State<SehatGyan> {
  bool autoPlay = false;

  Uri _url = Uri.parse(
      "https://artofhealthyliving.com/how-to-stay-healthy-when-you-work-a-sedentary-job/");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Firebasecard');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  filterQuality: FilterQuality.high,
                  image: AssetImage("assets/images/sehatgyan/sehatgyan.png")),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.brown[50],
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("VIDEOS"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text("Heath and Fitness Education",
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "s2NQhpFGIOg",
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "zlpFb33f98I",
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(videoid: "TsplHc3n9kg")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "CR5krXHkr2I",
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "krIgKr3IC7s",
                                )),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: Text("Famous Influencers on Health",
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "ejjA275HyiA",
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "8vAZrU9aOck",
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(videoid: "9-8UN0cPCmQ")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "xQeX2YZTjLY",
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 150),
                            child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                width: 180,
                                child: PlayVideo(
                                  videoid: "XreA78in4oc",
                                )),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 45),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.brown[50],
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("BLOGS"),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(_url)) {
                          await launchUrlString(
                              "https://artofhealthyliving.com/how-to-stay-healthy-when-you-work-a-sedentary-job/",
                              mode: LaunchMode.inAppWebView);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 345,
                                    child: Text(
                                      "HOW TO STAY HEALTHY WHEN YOU WORK A SEDENTARY JOB",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "artofhealthyliving.com",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: SizedBox(
                                  width: 500,
                                  child: Text(
                                    "Whether you're a powerlifter or simply want to build up strength, knowing — and testing — your one-rep max can help you meet your fitness goals.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(_url)) {
                          await launchUrlString(
                              "https://www.shape.com/fitness/workouts/strength-training/one-rep-max",
                              mode: LaunchMode.inAppWebView);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 345,
                                    child: Text(
                                      "How to Calculate and Use Your One-Rep Max In a Strength-Training Program",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "shape.com",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: SizedBox(
                                  width: 500,
                                  child: Text(
                                    "According to the World Health Organization (WHO), roughly 2 million people die yearly from physical...",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(_url)) {
                          await launchUrlString(
                              "https://www.nerdfitness.com/blog/walking/",
                              mode: LaunchMode.inAppWebView);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 345,
                                    child: Text(
                                      "How Many Calories Do You Burn While Walking?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "nerdfitness.com",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: SizedBox(
                                  width: 500,
                                  child: Text(
                                    "Walking is a great form of exercise and something we often recommend to folks starting our coaching program. ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(_url)) {
                          await launchUrlString(
                              "https://www.acefitness.org/resources/pros/expert-articles/nutrition/",
                              mode: LaunchMode.inAppWebView);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 345,
                                    child: Text(
                                      "Calories in vs. out? Or Hormones? The debate is finally over. Here’s who won",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "acefitness.org",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: SizedBox(
                                  width: 500,
                                  child: Text(
                                    "In this guest blog from Precision Nutrition, they discuss how important calories in vs. calories out really is, and we discuss what it means for you and your clients.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(_url)) {
                          await launchUrlString(
                              "https://www.wellandgood.com/what-muscles-does-walking-work/",
                              mode: LaunchMode.inAppWebView);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 345,
                                    child: Text(
                                      "3 Muscle Groups You Didn’t Realize You Activate Just By Walking",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "wellandgood.com",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: SizedBox(
                                  width: 500,
                                  child: Text(
                                    "According to walking coach and ACE-certified trainer Michele Stanten, walking challenges quite a few unexpected muscle groups as well",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(_url)) {
                          await launchUrl(_url, mode: LaunchMode.inAppWebView);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 345,
                                    child: Text(
                                      "7 Foods That Reduce Bloating—and 5 That Cause It",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "health.com",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: SizedBox(
                                  width: 500,
                                  child: Text(
                                    "Keep your digestive system humming along by eating flat-belly foods and avoiding those that cause bloat",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
