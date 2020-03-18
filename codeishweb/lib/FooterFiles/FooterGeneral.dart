import 'package:codeishweb/CheckScreenQuery/frequentFuncts.dart';
import 'package:flutter/material.dart';

class MyFooter extends StatefulWidget {
  @override
  _MyFooterState createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              children: <Widget>[
          SizedBox(
            height: 10,
          ),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
        Text("Find an issue with this page?",style: TextStyle(color: Colors.white,fontSize: 16.0,)),
        GestureDetector(
          onTap: (){
            print("Launch Link to GITHUB");
          },
          child: Text(" Fix it on Github",style: TextStyle(color: Colors.blue,fontSize: 16.0,)),
        )
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ _"
    ,style: TextStyle(color: Colors.white,fontSize: 16.0,)
    )
  ],
),
SizedBox(
  height: 50,
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("Copyright © 2019 Code-Ish LLC"
    ,style: TextStyle(color: Colors.white70,fontSize: 16.0,)
    ),
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("Created With Flutter and Dart"
    ,style: TextStyle(color: Colors.white70,fontSize: 16.0,))
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
Container(
  height: 50,
  width: 50,
  child: Image.asset("flutterLogo.png")),
Container(
  height: 100,
  width: 100,  
  child: Image.asset("dartLogo.png")),
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("Created by"
    ,style: TextStyle(color: Colors.white70,fontSize: 16.0,)),
        Text("Aberor Norbert"
    ,style: TextStyle(color: Colors.blue,fontSize: 16.0,)),
  ],
),
SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
Container(
  height: 50,
  width: 50,
  child: Image.asset("youtube.png")),
  SizedBox(
    width: 2,
  ),
Container(
  height: 50,
  width: 50,  
  child: Image.asset("twitter.png")),
    SizedBox(
    width: 2,
  ),
Container(
  height: 50,
  width: 50,
  child: Image.asset("github.png")),
  SizedBox(
    width: 2,
  ),
Container(
  height: 50,
  width: 50,  
  child: Image.asset("slack.png")),  
  ],
),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ _"
    ,style: TextStyle(color: Colors.white,fontSize: 16.0,))
  ],
),

SizedBox(
  height: 30,
),
Freqnt().isWeb(context) == true?Row(
  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Container(
  width: 100,
  //height: 100,
  child: Image.asset("gplay.png")
  ),
  SizedBox(width: 10,),
  Container(
  width: 100,
  height: 100,
  child: Image.asset("astore.png")
  ),  
],
):Column(
  children: <Widget>[
Container(
  width: 100,
  //height: 100,
  child: Image.asset("gplay.png")
  ),
  Container(
  width: 100,
  height: 100,
  child: Image.asset("astore.png")
  ),
  ],
),

SizedBox(
  height: 50,
)
              ],
            ),
    );
  }
}