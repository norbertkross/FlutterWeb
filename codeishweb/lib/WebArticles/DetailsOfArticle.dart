import 'package:codeishweb/FooterFiles/FooterGeneral.dart';
import 'package:codeishweb/toDo/SampleForExample.dart';
import 'package:flutter/material.dart';
import 'dart:js'as js;
import 'dart:html';


import 'package:flutter_markdown/flutter_markdown.dart';



class DetailsOfArticle extends StatefulWidget {
  String theId;
  String previewText;
  DetailsOfArticle({this.theId,String previewText});
  @override
  _DetailsOfArticleState createState() => _DetailsOfArticleState();
}

class _DetailsOfArticleState extends State<DetailsOfArticle> {
String pathTo = "available.bar/topic?id=Aberor";
  
Color bgColor = Color(0xFF070B39);
Color codeBgCol = Color(0xFF070B39);


@override
void initState() { 
  super.initState();
  //getUriFromLink();
  print("the id: ${widget.theId}");
}
  @override
  Widget build(BuildContext context) {  
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;  
//  print("The Route to be:\n\n ${routes.keys.elementAt(1)}"); 
    return Scaffold(
      backgroundColor: bgColor,
      body:ListView(
        
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: mwidth*.05),
                  child: Container(
                    width: mwidth*.80,
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("https://picsum.photos/id/1025/4951/3301")),
                                ),
                              //color: Colors.white,
                               height: 250, 
                               width: mwidth*.80,
                              //child: 
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 210),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.deepOrange,
                                  child: Text("A"),

                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          //color: Colors.white70,
                          width: MediaQuery.of(context).size.width*.8,
                        child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child:Markdown(
                        //selectable: true,
                        styleSheet: MarkdownStyleSheet(
                          //p: TextStyle(color: Colors.white,),
                          a: TextStyle(color: Colors.blue),                        
                          strong: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),
                          code: TextStyle(color: Colors.white),
                          listBullet: TextStyle(color: Colors.green,),
                          codeblockDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: codeBgCol,
                          ),
                          h1: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25), 
                          h2: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                          h3: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                          h4: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                          h5: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                          h6: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), ),                             
                        shrinkWrap: true,
                        data:SampleForExample.md,
                        //"**Hello World**  \n <h1>Aberor Norbert Eugene<h1> *Itaric*",
                        // widget.previewText.isEmpty?"Write to preview":widget.previewText,
                        onTapLink: (link){
                          //flutter_markdown: ^0.3.4
                          print("Link Tapped. Link: ");
                          print(link);
                          window.open(link,'$link');
                        },
                        ), //Text(),
            ),
          ),

                    SizedBox(height: 30,),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            color: Colors.white70,
                            child: Text("Comments",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                            width: MediaQuery.of(context).size.width*.8,
                          ),
                        ),
                      )                        
                      ],
                    ),
                  ),
                )
              ),

            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            width: mwidth,
            child: MyFooter(),

          ),
        ],
      )
    );
  }
}