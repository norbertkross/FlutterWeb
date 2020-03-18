import 'dart:html';
import 'dart:ui' as ui;
import 'package:codeishweb/Authentication/LoginHome.dart';
import 'package:codeishweb/CheckScreenQuery/frequentFuncts.dart';
import 'package:codeishweb/ElementsBody/returnSizedBody.dart';
import 'package:codeishweb/FooterFiles/FooterGeneral.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrontMain extends StatefulWidget {
  @override
  _FrontMainState createState() => _FrontMainState();
}

class _FrontMainState extends State<FrontMain> {
Color bgColor = Color(0xff111011);
Color cardColor = Color(0xff202021);
 bool isCollapsed = true;
 bool col = false; 
  
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;     


    return 
    // Scaffold(
    // backgroundColor:bgColor,  
    //   body: 
      Stack(
        children: <Widget>[
Column(
  children: <Widget>[
    
    Freqnt().isWeb(context) == true?
    // View if its computer web browser
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // For picture on the side of text
        Column(
          children: <Widget>[
            Container(
              width: mwidth*.45,
              height: mwidth*.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("facecoding.jpg"),
                  fit: BoxFit.fill
                )
              ),
            ),
          ],
        ),
        //SizedBox(width: mwidth*.05,),
        // For text besides picture
        Column(
          children: <Widget>[ 
            Container(
              width: mwidth*.45,
              //height: mwidth*.45,              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Build and ship 🔥 your app ⚡ faster",style:TextStyle(
                color:Colors.white,fontSize: 40,fontWeight: FontWeight.bold
              )),                  
                  Text("\nCode-Ish is an ecosystem of detailed and practical resources for developers who want to build and ship high-quality apps."
                  ,style:TextStyle(
                      color:Colors.white,fontSize: 25,
                    )
                  ),
                  SizedBox(height: 20,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
    RaisedButton(
      child: Row(
        children: <Widget>[
          Icon(Icons.code),
          Text("Start",style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      onPressed: (){},
    ),

    RaisedButton(
      child: Row(
        children: <Widget>[
          //Icon(Icons.code),
          Text("# ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Text(" LOGIN" ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        ],
      ),
      onPressed: (){
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (context)=>LoginHome()
        ));
      },
      color: Colors.purple,
    ),    
  ],
),                  
                ],
              ),
            )           
          ],
        )
      ],
    )
    :
//////// View for small devices
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // For picture on the side of text
        Column(
          children: <Widget>[
            Container(
              width: mwidth,
              height: mwidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("facecoding.jpg"),
                  fit: BoxFit.fill
                )
              ),
            ),
          ],
        ),
        //SizedBox(width: mwidth*.05,),
        // For text besides picture
        Column(
          children: <Widget>[ 
            Container(
              width: mwidth,
              //height: mwidth*.45,              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Build and ship 🔥 your app ⚡ faster Build and ship 🔥 your app ⚡ faster",style:TextStyle(
                color:Colors.white,fontSize: 40,fontWeight: FontWeight.bold
              )),
                  ),                  
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("\nCode-Ish is an ecosystem of detailed and practical resources for developers who want to build and ship high-quality apps."
                    ,style:TextStyle(
                        color:Colors.white,fontSize: 25,
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    RaisedButton(
      child: Row(
        children: <Widget>[
          Icon(Icons.code),
          Text("Start",style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      onPressed: (){},
    ),
SizedBox(width: 10,),
    RaisedButton(
      child: Row(
        children: <Widget>[
          //Icon(Icons.code),
          Text("# ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Text(" LOGIN" ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        ],
      ),
      onPressed: (){},
      color: Colors.purple,
    ),    
  ],
),          
                ],
              ),
            )           
          ],
        )
      ],
    ),

// inside main column in listview

SizedBox(height: 30,),

// devider 
// Container(
//   height: 2.0,
//   width: mwidth,
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       fit: BoxFit.cover,
//       image: AssetImage("devider.png")),
//     )
//   ),

SizedBox(height: 25,),

Center(
  child: Text("Learn By Doing",style:TextStyle(color: Colors.white70,fontSize: 40,fontWeight: FontWeight.bold)),
),

SizedBox(height: 20,),
Center(child: 
Text("Fast, efficient, Project-based Video Courses"
,style:TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold)
),),

PictureLayoutDescription(
displayImage: AssetImage("buildIll.png"),
//NetworkImage("https://picsum.photos/250?image=9"),
name: "Flutter Firebase App From Scratch",
description: "Build a Complex Product-Ready App with Flutter and Firebase",
onTaped: (){
  print("Tapped any part of card");
},
),
SizedBox(
  height: 100,
),
PictureLayoutDescription(
displayImage: AssetImage("codingRocket.png"),
//NetworkImage("https://picsum.photos/250?image=9"),
name: "Flutter Firebase App From Scratch",
description: "Build a Complex Product-Ready App with Flutter and Firebase",
onTaped: (){
  print("Tapped any part of card");
},
),
// SizedBox(
//   height: 100,
// ),
// PictureLayoutDescription(
// displayImage: NetworkImage("https://picsum.photos/250?image=9"),
// name: "Flutter Firebase App From Scratch",
// description: "Build a Complex Product-Ready App with Flutter and Firebase",
// onTaped: (){
//   print("Tapped any part of card");
// },
// ),
SizedBox(
  height: 100,
),
// Container(
//   height: 2.0,
//   width: mwidth,
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       fit: BoxFit.cover,
//       image: AssetImage("devider.png")),
//     )
//   ),

SizedBox(height: 25,),

Center(
  child: Text("Modern Fullstack",style:TextStyle(color: Colors.white70,fontSize: 40,fontWeight: FontWeight.bold)),
),

SizedBox(height: 20,),
Center(child: 
Text("Develop faster with scalable cloud infrastructure"
,style:TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold)
),),
SizedBox(
  height: 100,
),
PictureLayoutDescription(
displayImage: AssetImage("tch.jpg"),
//NetworkImage("https://picsum.photos/250?image=9"),
name: "Flutter Firebase App From Scratch",
description: "Build a Complex Product-Ready App with Flutter and Firebase",
onTaped: (){
  print("Tapped any part of card");
},
),
SizedBox(
  height: 100,
),
VideoBodyWidget(
  url: "prismHighLight/highLightCode.html",
  title: "the Title",
  iframId: "the-if-id",
  description: "my description",
),
SizedBox(
  height: 100,
),
PictureLayoutDescription(
displayImage: AssetImage("tch.jpg"),
//NetworkImage("https://picsum.photos/250?image=9"),
name: "Flutter Firebase App From Scratch",
description: "Build a Complex Product-Ready App with Flutter and Firebase",
onTaped: (){
  print("Tapped any part of card");
},
),
SizedBox(
  height: 100,
),

SizedBox(height: 25,),

Center(
  child: Text("Thinking Beyond the Code",style:TextStyle(color: Colors.white70,fontSize: 40,fontWeight: FontWeight.bold)),
),

SizedBox(height: 20,),
Center(child: 
Text("Accept payments and build your business"
,style:TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold)
),),
SizedBox(
  height: 100,
),
PictureLayoutDescription(
displayImage:AssetImage("flutterLogo.png"),
// NetworkImage("https://picsum.photos/250?image=9"),
name: "Swipe Payments Master Class",
description: "Build a Complex Product-Ready App with Flutter and Firebase",
onTaped: (){
  print("Tapped any part of card");
},
),
SizedBox(
  height: 200,
),

Column(
  children: <Widget>[
        RaisedButton(
      color: Colors.green,    
      onPressed: (){},    
      child: Text("\nALL PRO COURSES\n",style: TextStyle(color: Colors.white,fontSize: 24),),    
    ),
  ],
),
SizedBox(
  height: 100,
),


////////////////// Footer goes here  ////////////////////
///ClipSmallArea(imageName)
SizedBox(
  height: 30,
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Icon(Icons.mic,size:50,color:Colors.white),
    Text("your Host"
    ,style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
  ],
),

SizedBox(
  height: 50,
),


CardOnlyText(
  isString: false,
  widgetContent:Column(
    children: <Widget>[
      Container(
      child: Freqnt().isWeb(context) == true?Column(
        //mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         //ClipSmallArea("codingRocket2.png"), 
Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200.0)
      ),
      child:   Container(  
        height: 200,
        width: 200,
               decoration: BoxDecoration(  
                 image: DecorationImage(  
                   fit: BoxFit.cover,  
                   image: AssetImage("kross.jpg"),  
                 ),  
               ),
      
             ),
),
  SizedBox(height: 20,),      
       
         SizedBox(
           width: 10,
         ),

        ],
      ):Column(
        children: <Widget>[
        // ClipSmallArea("codingRocket2.png"), 
Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200.0)
      ),
      child:   Container(  
        height: 200,
        width: 200,
               decoration: BoxDecoration(  
                 image: DecorationImage(  
                   fit: BoxFit.cover,  
                   image: AssetImage("kross.jpg"),  
                 ),  
               ),
      
             ),
), 
SizedBox(height: 20,),      
      
        ],
      ),
),

Text("""
Hi der!, I'm Aberor Norbert and I created this project to help people build and ship high-quality apps. My mission is simple 👉 produce practical content that increases developer happiness and productivity 🚀.

I enjoy meeting new people and finding ways to help them have an uplifting experience.
I am dedicated, self-motivated and team player with excellent communication skills. 
A Passionate Developer Who Loves To Write Code And Solve Problems For Fun.I Love Travelling Too. 

And as Written Earlier ``Am In Love with a semi colon ; because sometimes I miss it so much``
""",style: TextStyle(color: Colors.white,fontSize: 20.0,)),
Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200.0)
      ),
      child:   Container(  
        height: 200,
        width: 200,
               decoration: BoxDecoration(  
                 image: DecorationImage(  
                   fit: BoxFit.cover,  
                   image: AssetImage("codingRocket2.png"),  
                 ),  
               ),
      
             ),
),


    ],
  ), 
),
SizedBox(
  height: 10,
),
CardOnlyText(
  isString: true,
  textData: """
Most engineering organizations will have to answer the question: 
“What makes a software developer a senior developer?” This is a challenging question because it is extremely subjective. 
Search for the answer on the internet and you will get many different answers. Some will contain criteria that are also subjective 
themselves which adds additional difficulty to the question.   
  """,
),
SizedBox(
  height: 10,
),

MyFooter()


  ],
),

        ],
      )
     // ,)
    ;
  }
}