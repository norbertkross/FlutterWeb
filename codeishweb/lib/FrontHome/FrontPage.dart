import 'dart:ui' as ui;
import 'dart:html';
import 'package:codeishweb/Clippers/clipMePath.dart';
import 'package:codeishweb/Dialogues/holdDialogs.dart';
import 'package:codeishweb/FrontHome/FrontMain.dart';
import 'package:codeishweb/Notifications/NotificationsBoard.dart';
import 'package:codeishweb/Search/searchDialogPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
//Color bgColor = Color(0xff111011);
String idVal;
Color bgColor = Color(0xFF070B39);
int itmIndx =-2;
Color cardColor = Color(0xff202021);
 bool isCollapsed = true;
 bool col = false;
 Duration animDuration = Duration(milliseconds: 500);




  bool isWeb(){
    bool isWebD = false;
    if(MediaQuery.of(context).size.width>=500){
      isWebD = true;
      return isWebD;
    }else{
      isWebD = false;
      return isWebD;
    }      
    }   

Widget frontBody({mwidth,mheight}){  
  return Container(
    color:bgColor,
    child: 
    ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipMePath(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10.0,),
                        IconButton(
                          onPressed: (){
                            setState(() {
                              isCollapsed = !isCollapsed;
                            });
                            },
                          icon: Icon(isCollapsed== true?Icons.menu:Icons.close,color: Colors.white,size: isWeb() == true?40:30,),
                        ),
                      ],
                    ),
                   Row(
                     children: <Widget>[
                       HoldDialogs(context: context).popupMenuButton(),
                       SizedBox(width: 10,),
                       GestureDetector(
                         onTap: (){
                           print("in the method that shows search bar");
                                          
  Navigator.of(context).push(
 PageRouteBuilder( opaque: false,pageBuilder: (BuildContext context,___, __){
          return SearchBar();
                      }
   ));
                         },
                         child: Icon(CupertinoIcons.search,color: Colors.white,size: 35,)),  
                         IconButton(
                           icon: Icon(CupertinoIcons.bell,size:35,color:Colors.white),
                           onPressed: (){

                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context)=>NotifyUsers(posterID: idVal,),
                        // )); 

                          Navigator.pushNamed(context, "/notifications",
                          arguments: ScreenArguments(idVal),
                          );


                           },
                         ),                     
                        SizedBox(width: 10,),
                     ],
                   ),
                   
                  ],
                ),              
              ],
            ),

            Container(
              child: Column(
                children: <Widget>[                
                  SizedBox(
                    height: 30,
                  ),
                      GestureDetector(
                        child: Text("Code-Ish {*^*}",style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),),
                        onTap: (){
                          setState(() {
                           isCollapsed = !isCollapsed; 
                          });                        
                        },), 
                        SizedBox(
                          height: 10.0,
                        ),
                    Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: Text("In Love with a semi colon ; because sometimes I miss it so much",
                      style: TextStyle(color: Colors.white70,fontSize: 20.0,),),
                    ),                      
                          SizedBox(
                            height: 50.0,
                          ),  

                ],
              ),
            ),
            FrontMain()
          ],
        ),
  );
}
  Widget inFront(){
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;    
  return AnimatedPositioned(
    duration: animDuration,
    top:isCollapsed ?0 :isWeb() == true?mheight*.5: mheight*.5,
    bottom:isCollapsed ?0 :isWeb() == true? mheight*-.5: mheight*-.5,
    right:0,
    left:0,
      child: Card(
        elevation: 30,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: frontBody(mwidth: mwidth,mheight: mheight)),
        );
      }


Widget baseOf(){
Color bgColor = Color(0xFF070B39);
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;  
  return 
  GestureDetector(
    onTap: (){
  setState(() {
    isCollapsed = !isCollapsed; 
  });       
    },
      child: Container(
      //color: Colors.white70,
      color: Color(0xff851de0),
      child: Center(
        child: Container(
          //color: Colors.yellow,
          width:isWeb()== true?mwidth*.5:mwidth*.8,
          height: mheight,
          //child: Padding(
          //  padding: EdgeInsets.all(mwidth*.4),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CupertinoButton(
                      child: Text("Home"
                      ,style: TextStyle(color:itmIndx == 0?Colors.deepOrange:Colors.white,
                      fontSize:itmIndx == 0?30:23,fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){
                        setState(() {
                          itmIndx = 0;
                          isCollapsed = !isCollapsed;
                        });

                        },
                    ),

                    CupertinoButton(
                      child: Text("Video Lessons"
                      ,style: TextStyle(color:itmIndx == 1?Colors.deepOrange:Colors.white,
                      fontSize:itmIndx == 1?30:23,fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, '/lessons');
                       
                        setState(() {
                          itmIndx = 1;
                          isCollapsed = !isCollapsed;
                        });},
                        
                    ),

                    CupertinoButton(
                      child: Text("Terms & Conditions"
                      ,style: TextStyle(color:itmIndx == 2?Colors.deepOrange:Colors.white,
                      fontSize:itmIndx == 2?30:23,fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){
                        setState(() {
                          itmIndx = 2;
                        });},
                    ),


                    CupertinoButton(
                      child: Text("Courses"
                      ,style: TextStyle(color:itmIndx == 3?Colors.deepOrange:Colors.white,
                      fontSize:itmIndx == 3?30:23,fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, '/courses');
                       
                        setState(() {
                          itmIndx = 3;
                          isCollapsed = !isCollapsed;
                        });},
                        
                    ),                                       

                    CupertinoButton(
                      child: Text("Privacy"
                      ,style: TextStyle(color:itmIndx == 5?Colors.deepOrange:Colors.white,
                      fontSize:itmIndx == 5?30:23,fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){
                        setState(() {
                          itmIndx = 5;
                        });},
                    ), 

                  ],
                ),
                //this ocupies the remaining space underneath the items List here
                Container(
                  width: mwidth,
                  height: mheight*.7,
                ),
              ],
            ),
         // ),
        ),
      ),
    )
    ,
  )
  ;
}


_showPref()async{
SharedPreferences prefs = await SharedPreferences.getInstance();
int keyVal = (prefs.getInt("myKey")??0);
idVal = (prefs.getString("repMoi")??"nothing");
// print(" 1. new prefs: $count");
//await prefs.setInt("myKey", 98);
print(" 2. new prefs: KeyVal :$keyVal  IdVal : $idVal");
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showPref();
  }  
  
  
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;     
 
    return Scaffold(
    backgroundColor:bgColor,  
      body: Stack(
        children: <Widget>[
          baseOf(),
          inFront(),
        ],
      ),      
    );
  }
}
