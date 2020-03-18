import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'dart:html';
import 'dart:js'as js;


class TypeMessage extends StatefulWidget {
  @override
  _TypeMessageState createState() => _TypeMessageState();
}

class _TypeMessageState extends State<TypeMessage> with SingleTickerProviderStateMixin  {
TabController _controller; 
TextEditingController _textEditingController;
String previewText = "";
String thetext = "hey kross here";
String theText = """my name is kofi ```[codeish](http.codeish.com)``` [codeish](http.codeish.com), my sister is ama.K++ kofi and kwadjo are not friends of kofi jnr ama sister\n**This is Bold**\n 
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
  
  **OKAY TRYING to put HTML and JS for CODE**
<head>
<link href="prism.css" rel="stylesheet" />
<script src="prism.js"></script>
</head>
<body>
<pre>
<code class="language-dart">

import 'package:flutter/material.dart';

class FrontMain extends StatefulWidget {
  @override
  _FrontMainState createState() => _FrontMainState();
}

class _FrontMainState extends State<FrontMain> {
   Color bgColor = Color(0xff0a0a0a);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:bgColor,
      //hexadecimal color codes from color code picker google
      // black d0 = #0a0a0a
      // black d1= #212422
      // black d2 = #2b2a2a
     // black d3 = #262424
     // green 0 = #1fc70c
     // green 1 =  #17ab07
     // green 2 =  #19db04
     // orange 0 = #eb6d00
    // orange 1 =  #f77c11
     // orange 2 = #db7923
      body: ListView(
        children: <Widget>[
          Container(
            color: bgColor,
            child: Column(
              children: <Widget>[
                Text("The Scaffold"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
</code>
</pre>
</body>

  """; 



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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: "writeMessage",
        //child: Icon(Icons.bubble_chart),
        child: Icon(Icons.near_me),
        onPressed: (){},
      ),
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
      body:TabBarView(
        controller: _controller,
        children: <Widget>[
          //Icon(Icons.add),
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Container(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (String text){
                  setState(() {
                    previewText = text;
                  });
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write Message"
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:Markdown(
                data: previewText.isEmpty?"Write to preview":previewText,
                onTapLink: (link){
                  print(link);
                  window.open(link,'$link');
                },
                ), //Text(),
            ),
          )
        ],
      ),
    );
  }
}

// Alter Table tableName Add columnName varchar Not Null
