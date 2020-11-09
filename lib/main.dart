import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Guide.dart';
import 'Quizzes.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
    keywords: <String>['guide', 'guide for cod'],
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    testDevices: <String>[],
  );
  BannerAd mybanner = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print('Banner Event is $event');
      });
  InterstitialAd myInterstitial = InterstitialAd(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print('Interstitial Event Is $event');
      });

  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3940256099942544~3347511713");
    mybanner
      // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        //anchorOffset: 60.0,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        //horizontalCenterOffset: 10.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );
    return Scaffold(
        appBar: AppBar(
          title: Text('COD Guide'),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 280,
                  height: 60,
                  child: FlatButton.icon(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Guide()));
                      myInterstitial
                        ..load()
                        ..show(
                            //anchorType: AnchorType.bottom,
                            //anchorOffset: 0.0,
                            //horizontalCenterOffset: 0.0,
                            );
                    },
                    label: Text(
                      'Guide',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    icon: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 280,
                  height: 60,
                  child: FlatButton.icon(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Quizzes()));
                      myInterstitial
                        ..load()
                        ..show(
                            //anchorType: AnchorType.bottom,
                            //anchorOffset: 0.0,
                            //horizontalCenterOffset: 0.0,
                            );
                    },
                    label: Text(
                      'quizzes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    icon: Icon(
                      Icons.question_answer,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 120,
                      height: 60,
                      child: FlatButton.icon(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10)),
                        label: Text(
                          'Share',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Share.share(
                              'https://play.google.com/store/apps/details?id=com.whatsapp');
                        },
                        /* Text(
                        'Share',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),*/
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 120,
                        height: 60,
                        child: FlatButton.icon(
                            color: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10)),
                            onPressed: _launchURL,
                            icon: Icon(
                              Icons.star_rate,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Rate',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 280,
                  height: 60,
                  child: FlatButton.icon(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    onPressed: _launchURL2,
                    label: Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    icon: Icon(
                      Icons.privacy_tip,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 280,
                  height: 60,
                  child: FlatButton.icon(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    onPressed: _launchURL3,
                    label: Text(
                      'More Apps',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

_launchURL() async {
  const url =
      'https://play.google.com/store/apps/details?id=com.example.flutter_app';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url =
      'https://englishoris.blogspot.com/2020/09/story-maker-video-editor.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'https://play.google.com/store/apps/dev?id=8784294396882762556';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
