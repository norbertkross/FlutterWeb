import 'package:codeishweb/CheckScreenQuery/frequentFuncts.dart';
import 'package:codeishweb/ElementsBody/returnSizedBody.dart';
import 'package:codeishweb/FooterFiles/FooterGeneral.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  Color bgColor = Color(0xFF070B39);
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;      
    return Scaffold(
    backgroundColor:bgColor,  
    body: ListView(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
Center(
  child:   Text("Courses",style: TextStyle(color: Colors.white,
  
    fontSize: 40.0,fontWeight: FontWeight.bold),),
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
    ,style: TextStyle(color: Colors.white70,fontSize: 20.0,fontWeight: FontWeight.bold)
    )
  ],
),  
        SizedBox(
          height: 100,
        ),

PictureLayoutDescriptionButton(
  displayImage: NetworkImage("https://picsum.photos/id/1025/4951/3301"),
  name: "FLutter And Firebase Course",
  description: "Build A High Performance Application with Flutter And Dart",
  onTaped: (){
    print("... To Course Details ...");
  },
  button:ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: mwidth*.15),
        child: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Text("Start"),
            onPressed: (){print("... To Course Details ...");},
            color: Colors.green,
          ),
      ),
    ],
  ),
),
        SizedBox(
          height: 100,
        ),

PictureLayoutDescriptionButton(
  displayImage: NetworkImage("https://picsum.photos/id/1002/4312/2868"),
  name: "FLutter And Firebase Course",
  description: "Build A High Performance Application with Flutter And Dart",
  onTaped: (){
    print("... To Course Details ...");
  },
  button:ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: mwidth*.15),
        child: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Text("Start"),
            onPressed: (){print("... To Course Details ...");},
            color: Colors.green,
          ),
      ),
    ],
  ),
),

        SizedBox(
          height: 100,
        ),

PictureLayoutDescriptionButton(
  displayImage: NetworkImage("https://picsum.photos/id/1015/6000/4000"),
  name: "FLutter And Firebase Course",
  description: "Build A High Performance Application with Flutter And Dart",
  onTaped: (){
    print("... To Course Details ...");
  },
  button:ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: mwidth*.15),
        child: CupertinoButton(
          borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Text("Start"),
            onPressed: (){print("... To Course Details ...");},
            color: Colors.green,
          ),
      ),
    ],
  ),
),
        SizedBox(
          height: 100,
        ),
PictureLayoutDescriptionButton(
  displayImage: NetworkImage("https://picsum.photos/id/1014/6016/4000"),
  name: "FLutter And Firebase Course",
  description: "Build A High Performance Application with Flutter And Dart",
  onTaped: (){
    print("... To Course Details ...");
  },
  button:ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: mwidth*.15),
        child: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Text("Start"),
            onPressed: (){print("... To Course Details ...");},
            color: Colors.green,
          ),
      ),
    ],
  ),
),

/***************************Footer***************************/

SizedBox(
  height: 150,
),
MyFooter()

/********* Footer*********/
      ],
    ),
    );
  }
}