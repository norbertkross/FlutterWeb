import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;


// Provide body with padding 
class ElementBodyTemp extends StatefulWidget {
  Widget newbody;
  ElementBodyTemp(
    this.newbody
  );
  @override
  _ElementBodyTempState createState() => _ElementBodyTempState();
}

class _ElementBodyTempState extends State<ElementBodyTemp> {
Color bgColor = Color(0xff111011);
Color cardColor = Color(0xff202021);  
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;     
    return Padding(
    padding: EdgeInsets.fromLTRB(mwidth*.03, 8, 8, 8),
    child: Container(
      //color: Color(0xff212422),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 20.0,
            color: cardColor,
            child: Column(
            children: <Widget>[
                widget.newbody,
            ],
          ),)
        ],
      ),
    ),
);         
  }
}


// Give a layoyt which takes an image ,Name and description,
class PictureLayoutDescription extends StatefulWidget {
  ImageProvider displayImage;
  String name;
  String description;
  Function onTaped;

  PictureLayoutDescription(
    {@required this.displayImage,
    @required this.name,
    @required this.description,
    @required this.onTaped
    }
  );
  @override
  _PictureLayoutDescriptionState createState() => _PictureLayoutDescriptionState();
}

class _PictureLayoutDescriptionState extends State<PictureLayoutDescription> {
Color bgColor = Color(0xff111011);
Color cardColor = Color(0xff202021);    
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;    
    return Padding(
    padding: EdgeInsets.fromLTRB(mwidth*.03, 8, 8, 8),
    child: Container(
      //color: Color(0xff212422),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 20.0,
            color: cardColor,
            child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: SizedBox(
                      width: 800,
                      height: 400,
                      child: GestureDetector(
                        onTap: widget.onTaped,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: widget.displayImage,
                              fit: BoxFit.fill
                            )
                          ),
                          ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: widget.onTaped,
                  child: Text(widget.name,style: TextStyle(color: Colors.white,
                  fontSize: 30.0,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                      GestureDetector(
                        onTap: widget.onTaped,
                        child: Text(widget.description,style: TextStyle(color: Colors.white70,fontSize: 20.0,),)),                  
                  ],
                ),
              )
            ],
          ),)
        ],
      ),
    ),
    );
  }
}

// Give a layoyt which takes an image ,Name and description,AND Button
class PictureLayoutDescriptionButton extends StatefulWidget {
  ImageProvider displayImage;
  String name;
  String description;
  Function onTaped;
  Widget button;

  PictureLayoutDescriptionButton(
    {@required this.displayImage,
    @required this.name,
    @required this.description,
    @required this.onTaped,
    @required this.button
    }
  );
  @override
  _PictureLayoutDescriptionButtonState createState() => _PictureLayoutDescriptionButtonState();
}

class _PictureLayoutDescriptionButtonState extends State<PictureLayoutDescriptionButton> {
Color bgColor = Color(0xff111011);
Color cardColor = Color(0xff202021);    
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;    
    return Padding(
    padding: EdgeInsets.fromLTRB(mwidth*.03, 8, 8, 8),
    child: Container(
      //color: Color(0xff212422),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 20.0,
            color: cardColor,
            child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: SizedBox(
                      width: 800,
                      height: 400,
                      child: GestureDetector(
                        onTap: widget.onTaped,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: widget.displayImage,
                              fit: BoxFit.fill
                            )
                          ),
                          ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: widget.onTaped,
                  child: Text(widget.name,style: TextStyle(color: Colors.white,
                  fontSize: 30.0,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                      GestureDetector(
                        onTap: widget.onTaped,
                        child: Text(widget.description,style: TextStyle(color: Colors.white70,fontSize: 20.0,),)),                  
                       SizedBox(
                         height: 5,
                       ),
                        widget.button,
                  ],
                ),
              )
            ],
          ),)
        ],
      ),
    ),
    );
  }
}




class CardOnlyText extends StatefulWidget {
  final Widget widgetContent;
  final bool isString;
  final String textData;
  CardOnlyText({this.textData,@required this.isString,this.widgetContent});
  @override
  _CardOnlyTextState createState() => _CardOnlyTextState();
}

class _CardOnlyTextState extends State<CardOnlyText> {

Color cardColor = Color(0xff202021);  

  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;    
    return Padding(
    padding: EdgeInsets.fromLTRB(mwidth*.03, 8, 8, 8),
    child: Container(
      //color: Color(0xff212422),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 20.0,
            color: cardColor,
            child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: SizedBox(
                  width: 800,
                  //height: 400,
                  child:widget.isString ==true?Text(widget.textData
              ,style: TextStyle(color: Colors.white,fontSize: 20.0,),      
      ):widget.widgetContent,
                ),
                ),
              ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



////////////////////////   Video widget , it return a padded, center aligned video contained wiedget

class VideoBodyWidget extends StatefulWidget {
  final String url;
  final String iframId;
  final String title;
  final String description;
  final Function onTaped;
  VideoBodyWidget(
{@required this.iframId,
@required this.url,
@required this.title,
@required this.description,
this.onTaped
}
  );
  @override
  _VideoBodyWidgetState createState() => _VideoBodyWidgetState();
}

class _VideoBodyWidgetState extends State<VideoBodyWidget> {
Color cardColor = Color(0xff202021);    

  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;     
  ui.platformViewRegistry.registerViewFactory(
     // 'hello-world-html',
     '${widget.iframId}',
      (int viewId) => IFrameElement()
        ..width = '800'
        ..height = '400'
       // ..src = 'http://www.youtube.com/embed/W7qWa52k-nE'
        ..src = '${widget.url}'
        ..style.border = 'none');     
    return 
Padding(
    padding: EdgeInsets.fromLTRB(mwidth*.03, 8, 8, 8),
    child: Container(
      //color: Color(0xff212422),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 20.0,
            color: cardColor,
            child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: SizedBox(
                  width: 800,
                  height: 400,
                  child: HtmlElementView(viewType: widget.iframId/*'hello-world-html'*/),
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: GestureDetector(
                    onTap:widget.onTaped != null?widget.onTaped:null,
                  child: Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
GestureDetector(
  onTap:widget.onTaped != null?widget.onTaped:null,
  child:   Text(widget.description
  
  ,style: TextStyle(color: Colors.white70,fontSize: 20.0,),),
),
SizedBox(height: 5,),
// Row(
//   mainAxisSize: MainAxisSize.min,
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: <Widget>[
//     RaisedButton(
//       child: Row(
//         children: <Widget>[
//           Icon(Icons.code),
//           Text("  CODE",style: TextStyle(fontWeight: FontWeight.bold),),
//         ],
//       ),
//       onPressed: (){},
//     ),
//     SizedBox(
//       width: 50,
//     ),
//     RaisedButton(
//       child: Row(
//         children: <Widget>[
//           //Icon(Icons.code),
//           Text("# ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
//           Text(" SLACK" ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
//         ],
//       ),
//       onPressed: (){},
//       color: Colors.purple,
//     ),    
//   ],
// ),                  
                  ],
                ),
              )
            ],
          ),)
        ],
      ),
    ),
);
  }
}