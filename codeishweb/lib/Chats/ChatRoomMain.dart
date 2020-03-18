import 'dart:html';

import 'package:codeishweb/CheckScreenQuery/frequentFuncts.dart';
import 'package:codeishweb/WebArticles/TypeMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';


class ChatroomMain extends StatefulWidget {
  @override
  _ChatroomMainState createState() => _ChatroomMainState();
}

class _ChatroomMainState extends State<ChatroomMain> {
  Color bgColor = Color(0xFF070B39);
  Color codeBgCol = Color(0xFF070B39);
  bool showTexting = true;
  String chat_id = "0xFF&(070B^#39";
  List msgListOf = [
    "",
    ""
  ];

DateTime now = DateTime.now();

dt(){
  var dt = DateTime.parse("2019-12-10 08:08:45");
  print("dt $dt");
  var fmt = DateFormat("HH:mm").format(now);
  print("date time  time: $fmt and Time ago=> ${timeago.format(dt)}");
}

Widget msgCard(String chatId,{String chatMsg}){
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Clipboard.setData(ClipboardData(text: chatMsg)).then((value) => {
                      Toast.show("Text Copied ! ", context, 
                      duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER,
                      backgroundColor: Colors.white.withOpacity(.4),
                      textColor: Colors.white
                      )
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.only(bottom: 0.0),
                    child: Container(
                      width: 80,
                      height: 40,
                      child: Icon(Icons.content_copy),
                    ),
                  ),
                ),
              ],
            ),       
                  Card(
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("\nUserName\n"),
                          ],
                        ),
                        Markdown(
                          selectable:true,
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(color: Colors.white,),
                            a: TextStyle(color: Colors.blue),                        
                            strong: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),
                            code: TextStyle(color: Colors.white70),
                            listBullet: TextStyle(color: Colors.green,),
                            codeblockDecoration: BoxDecoration(
                              color: codeBgCol
                            ),
                            h1: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25), 
                            h2: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h3: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h4: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h5: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h6: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                          ),
                          shrinkWrap: true,
                          // leave spaces before variable for word
                          data:
                          """ **Kofi Mensa**
 [I'm an inline-style link](https://www.google.com)


```
List<TextSpan> _getTheSpans(
        String text,
        List<String> matchWords,
        TextStyle style,
      ) {
        
        var wordsMap = Map.fromIterable(text.split(' '),
            key: (v) => v, value: (v) => TextSpan(text: v));

        for (var matchWord in matchWords) {
          if (wordsMap.containsKey(matchWord)) {
            wordsMap[matchWord] = TextSpan(text: matchWord, style: style);
          }
        }

        var spanList = wordsMap.values.toList();

        //adding missing spaces
        for (var i = 0; i < spanList.length - 1; ++i) {
          spanList[i] =
              TextSpan(text: spanList[i].text + ' ', style: spanList[i].style);
        }

        return spanList;
      }
      ``` 
      and the rest is history at [YouTube](https://youtube.com) """
      ,
                          onTapLink: (link){
                            print(link);
                            window.open(link,'$link');
                          },
                        ),
                      ],
                    ),
                  ) ,      
      Card(
        margin: EdgeInsets.fromLTRB(4,0,4,4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: (){
                //Clipboard.setData(ClipboardData(text: quote));
              },
              icon: Icon(Icons.thumb_up,color:Colors.blue),
            ),
            SizedBox(width: 5,),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.thumb_down,color:Colors.redAccent),
            ),  
         
          ],
        ),
      )
    ],
  );
}


Widget buttomItems(){

double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height; 

  return Align(
    alignment: Alignment.bottomCenter,
      child: Container(
      width: mwidth,
      height: mheight*.1,
      child:  Padding(
      padding:  EdgeInsets.symmetric(horizontal:
      Freqnt().isWeb(context)==true?mwidth*.201:11),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: mwidth*.1,),
                IconButton(
                  icon: Icon(Icons.photo_size_select_actual),
                  onPressed: (){},
                  iconSize: 60,
                ),

                IconButton(
                  icon: Icon(Icons.code),
                  onPressed: (){},
                  iconSize: 60,
                ),

                IconButton(
                  icon: Icon(Icons.mic_none),
                  onPressed: (){},
                  iconSize: 60,
                ),

                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: (){},
                  iconSize: 60,
                ),                                                            
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child:IconButton(
                icon: Icon(Icons.close,size: 35,),
                onPressed: (){
                  setState(() {
                    showTexting =!showTexting;
                  });                  
                },
              ) ,
            ))
        ],
      ),
                 ),
    ),
  );  
}


@override
void initState() { 
  super.initState();
  print("${now.toString()}");
  dt();
}
  @override
  Widget build(BuildContext context) {
final SendArguments scrnArgs = ModalRoute.of(context).settings.arguments;   
//print(scrnArgs.query);
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height; 
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              //Icons.device_hub
              Icons.menu,
              size: 40,
              ),
            onPressed: (){},
            color: Colors.white,
          ),
          SizedBox(width: 30,)
        ],
        leading: IconButton(
          icon: Icon(Icons.dashboard),
          onPressed: null,
          color: Colors.green,
          ),
        title: Text("Messages"),
        centerTitle: true,
      ),

      backgroundColor: bgColor,
      body:Stack(
        children: <Widget>[

          Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: 13,
                     itemBuilder: (context,index){
                       return Padding(
                         padding:  EdgeInsets.symmetric(horizontal:
                         Freqnt().isWeb(context)==true?mwidth*.2:10),
                         child: msgCard(index.toString(),chatMsg:"Hey You! Web Designer"),
                           );
                         },
                       ),
                    ),                            
                  ],
                ),
        Padding(
            padding:  EdgeInsets.only(right: 80,bottom: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
        
        hoverColor: Colors.orangeAccent,
        hoverElevation: 15.0,
        child: Icon(Icons.mode_comment),
        onPressed: (){

  Navigator.of(context).push(
  PageRouteBuilder( opaque: true,pageBuilder: (BuildContext context,___, __){
  return TypeMessage();
       }
   ));

        },
      ),
            ),
          ),
             ],
           ),
        );
    }            
}



class SendArguments {
  final String query;
  
  SendArguments(this.query);
}