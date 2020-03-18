import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'dart:html';


class WriteArticles extends StatefulWidget {

  final getData;
  WriteArticles({this.getData});
  @override
  _WriteArticlesState createState() => _WriteArticlesState();
}

class _WriteArticlesState extends State<WriteArticles> {
  @override
  void initState() { 
    super.initState();
   print("the routes name ${widget.getData}");
  }
  @override
  Widget build(BuildContext context) {
    return WrittingArticle(    

    );
  }
}





class WrittingArticle extends StatefulWidget {
  @override
  _WrittingArticleState createState() => _WrittingArticleState();
}

class _WrittingArticleState extends State<WrittingArticle> with SingleTickerProviderStateMixin  {
TabController _controller; 
TextEditingController _textEditingController;
String previewText = "";
Color bgColor = Color(0xFF070B39);
Color codeBgCol = Color(0xFF070B39);





@override
void initState() { 
  super.initState();
  
  _controller = TabController(length: 2,vsync: this);
  _textEditingController = TextEditingController();
}

  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width;     

    return Scaffold(
      backgroundColor:bgColor,
      appBar: AppBar(
        actions: <Widget>[
          Container(
            height: 70,
            width: mwidth - 10,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
           Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text("Drag <<        ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
             ],
           ),

          Icon(Icons.title,color: Colors.red,size: 30,),
           Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text("# Header  ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
             ],
           ),


          Icon(Icons.code,color: Colors.red,size: 30,),
           Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text("``` {Code} ```",style: TextStyle(color: Colors.black),),
             ],
           ),
           //),
           Icon(Icons.format_bold,color: Colors.green,size: 30,),
          Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text("**Bold**  ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
             ],
           ),  
           Icon(Icons.link,color: Colors.blue,size: 30,),

          Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text(" [Google](https://google.com)      ",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),),
             ],
           ),  

           Icon(Icons.photo_library,color: Colors.blue,size: 30,),

          Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text(" ![Image](https://picsum.photos/250?image=9) ",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),),
             ],
           ),
                             
           Icon(Icons.format_italic,color: Colors.deepOrange,size: 30,),
          Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text("*Italic*  ",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),),
             ],
           ),            
           Icon(Icons.local_parking,color: Colors.indigo,size: 25,),
          Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
              RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                style: TextStyle(backgroundColor: Colors.blue,color: Colors.white),
                text: "Paragraph "                    

                  )
                ],
                    text: '> ',
                    style: TextStyle(color: Colors.black)
              ),    
              ) 
             ],
           ),            
            

              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
          Tab(child: Text("Editing",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),),
          Tab(child: Text("Preview",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),),
        ],),
      ),
      body:Stack(
        children: <Widget>[
          TabBarView(
            controller: _controller,
            children: <Widget>[
              //Icon(Icons.add),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: mwidth*.05),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    color: Colors.white70,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String text){
                          setState(() {
                            previewText = text;
                          });
                        },
                        controller: _textEditingController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write Message"
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
              padding:EdgeInsets.symmetric(horizontal: mwidth*.05),
                child: Container(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:previewText.isNotEmpty?Markdown(
                          selectable:true,
                          styleSheet: MarkdownStyleSheet(
                            //p: TextStyle(color: Colors.white,),
                            blockquote: TextStyle(color: Colors.yellow),
                            a: TextStyle(color: Colors.blue),                        
                            strong: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
                            code: TextStyle(color: Colors.white),
                            listBullet: TextStyle(color: Colors.green,),
                            codeblockDecoration: BoxDecoration(
                              color: codeBgCol,
                            ),
                            h1: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25), 
                            h2: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h3: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h4: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h5: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), 
                            h6: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), ),                      
                      data:previewText,
                      onTapLink: (link){
                        print(link);
                        window.open(link,'$link');
                      },
                      ):Container(child: Text("    Write to preview"),), //Text(),
                  ),
                ),
              )
            ],
          ),


          Padding(
            padding: EdgeInsets.only(bottom:30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green,
                child: Text("      Publish      "),
                onPressed: (){},
              )

            ),
          )
        ],
      ),
    );
  }
}