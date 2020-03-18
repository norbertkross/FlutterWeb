import 'package:codeishweb/FooterFiles/FooterGeneral.dart';
import 'package:flutter/material.dart';


class Lessons extends StatefulWidget {
  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  Color bgColor = Color(0xFF070B39);
  List items = ["Hello package:flutter/material.dart","qwrer rtthesr Can","gbwvhbfkv bghbgrek You","package:flutter/material.dart Here Hello package:flutter/material.dart Hello package:flutter/material.dart","Me","As","I","Scream","Your","Name"];
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;      
    return Scaffold(
    backgroundColor:bgColor,  
    body: ListView(
      //shrinkWrap: true,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
        Text("Watch Latest Lessons",style: TextStyle(color: Colors.white,
    
      
    
        fontSize: 35.0,fontWeight: FontWeight.bold),),
  ],
),
  
        SizedBox(
          height: 50,
        ),    
    
Padding(
  padding:EdgeInsets.symmetric(horizontal: mwidth*.05),
  child:   GridView(
  
    shrinkWrap: true,
  
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  
    crossAxisSpacing: 5.0,
  
    mainAxisSpacing: 5.0,
  
    crossAxisCount: mwidth<1200?2:mwidth<=1500?3:4,
  
  ),
  
  children: <Widget>[
  
     for (var i =0; i<=items.length-1;i++) Card(
  
      //color:Colors.orange,
  
      child: Stack(
  
        children: <Widget>[
  
          // Center(
  
          //   child: LinearProgressIndicator(),
  
          // ),
  
          Container(
  
            decoration: BoxDecoration(
  
              image: DecorationImage(
  
                image: NetworkImage("https://picsum.photos/id/1014/6016/4000"),
  
                fit: BoxFit.cover
  
              )
  
            ),
  
            child: Center(
  
              child: Column(
  
                mainAxisSize: MainAxisSize.min,
  
                children: <Widget>[
  
                  ClipRRect(
  
                    borderRadius: BorderRadius.circular(10),
  
                    child: Container(
  
                      color: Colors.black.withOpacity(.2),
  
                      child: Text("'\u{1F4AF}' ${items[i]!=null?items[i]:'waiting ...'} ")),
  
                  ),
  
                  RaisedButton(
  
                    color: Colors.blue.withOpacity(.1),
  
                    onPressed: (){},
  
                    child: Icon(Icons.play_arrow),
  
                  )  
  
                ],
  
              ),
  
            ),
  
          ),
  
        ],
  
      ),
  
    ),  
  
  ],
  
  ),
),  

///// ************************ Footer*********************** ////


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