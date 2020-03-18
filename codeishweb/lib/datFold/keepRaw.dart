import 'dart:html';
import 'dart:ui' as ui;
import 'package:codeishweb/Clippers/clipMePath.dart';
import 'package:codeishweb/Dialogues/holdDialogs.dart';
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
    child: ListView(
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
                            print("Hello, touched Meneu");
                            },
                          icon: Icon(isCollapsed== true?Icons.menu:Icons.close,color: Colors.deepOrange,size: isWeb() == true?40:30,),
                        ),
                      ],
                    ),
                   Row(
                     children: <Widget>[
                       HoldDialogs(context: context).popupMenuButton(),
                       SizedBox(width: 10,)
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
                        child: Text("Code-Ish { /> }",style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold),),
                        onTap: (){
                          setState(() {
                           isCollapsed = !isCollapsed; 
                          });                        
                        },), 
                        SizedBox(
                          height: 10.0,
                        ),
Text("In Love with a semi colon ; because sometimes I miss it so much",
style: TextStyle(color: Colors.white70,fontSize: 20.0,),),                      
                          SizedBox(
                            height: 50.0,
                          ),  
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
                padding: EdgeInsets.all(15.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: SizedBox(
                      width: 800,
                      height: 400,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://picsum.photos/250?image=9'),
                            fit: BoxFit.fill
                          )
                        ),
                        ),
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Firestore Data Modeling Course",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                      Text("In Love with a semi colon because sometimes I miss it so much",style: TextStyle(color: Colors.white70,fontSize: 20.0,),),                  
                  ],
                ),
              )
            ],
          ),)
        ],
      ),
    ),
), 


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
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: SizedBox(
                  width: 800,
                  //height: 400,
                  child: Text("""
The widget below is responsible for capturing an image file from the device, either via the camera or the photo gallery. Once a file is selected, a preview will be shown in the UI and the user can crop, resize, or rotate the raw Dart File. The image_cropper plugin does all the heavy lifting for the image manipulation, so we gain a ton of functionality with minimal code.

Image Capture Widget
Both _pickImage and _cropImage are async methods that update the state of the widget with an image file. If the image is defined, the app displays a visual preview with the Image widget and provides buttons to crop or clear it.

Notice how the file is being passed down to Uploader. This is a custom widget defined in the next section to manage the file upload task.      
      """
,style: TextStyle(color: Colors.white,fontSize: 20.0,),      
      ),
                ),
                ),
              ),
              ],
              ),
            ),
          ],
        ),
      ),
    ),




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
                  child: HtmlElementView(viewType: 'hello-world-html'),
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Firestore Data Modeling Course",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding:EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
Text("In Love with a semi colon because sometimes I miss it so much"
,style: TextStyle(color: Colors.white70,fontSize: 20.0,),),
SizedBox(height: 5,),
Row(
  mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    RaisedButton(
      child: Row(
        children: <Widget>[
          Icon(Icons.code),
          Text("  CODE",style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      onPressed: (){},
    ),
    SizedBox(
      width: 50,
    ),
    RaisedButton(
      child: Row(
        children: <Widget>[
          //Icon(Icons.code),
          Text("# ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Text(" SLACK" ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
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
          ),)
        ],
      ),
    ),
),                        

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
                  child: HtmlElementView(viewType: 'code-world-html'),
                ),
                ),
              ),

            ],
          ),)
        ],
      ),
    ),
),


Padding(
    padding: EdgeInsets.fromLTRB(mwidth*.03, 8, 8, 8),
    child: Container(
      //color: Color(0xff212422),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 20.0,
            color: Color(0xff454546),
            child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: SizedBox(
                  width: 800,
                  //height: 400,
                  child: Text("""
The widget below is responsible for capturing an image file from the device, either via the camera or the photo gallery. Once a file is selected, a preview will be shown in the UI and the user can crop, resize, or rotate the raw Dart File. The image_cropper plugin does all the heavy lifting for the image manipulation, so we gain a ton of functionality with minimal code.

Image Capture Widget
Both _pickImage and _cropImage are async methods that update the state of the widget with an image file. If the image is defined, the app displays a visual preview with the Image widget and provides buttons to crop or clear it.

Notice how the file is being passed down to Uploader. This is a custom widget defined in the next section to manage the file upload task.      
      """
,style: TextStyle(color: Colors.white,fontSize: 20.0,),      
      ),
                ),
                ),
              ),
              ],
              ),
            ),
          ],
        ),
      ),
    ),




                ],
              ),
            ),
          ],
        ),
  );
}
  Widget inFront(){
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;    
  return AnimatedPositioned(
    duration: animDuration,
    top:isCollapsed ?0 :isWeb() == true?0: mheight*.001,
    bottom:isCollapsed ?0 :isWeb() == true?0: mheight*.001,
    right:isCollapsed ?0 :isWeb() == true?mwidth*-.6: mwidth*-.3,
    left:isCollapsed ?0 : isWeb() == true?mwidth*.4: mwidth*.7,
      child: frontBody(mwidth: mwidth,mheight: mheight),
        );
      }


Widget baseOf(){
  return Container(
    color: Colors.green,
  );
}
  
  
  
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;     
  // ui.platformViewRegistry.registerViewFactory(
  //     'hello-world-html',
  //     (int viewId) => IFrameElement()
  //       ..width = '800'
  //       ..height = '400'
  //       ..src = 'http://www.youtube.com/embed/W7qWa52k-nE'
  //       ..style.border = 'none');  

  // ui.platformViewRegistry.registerViewFactory(
  //     'code-world-html',
  //     (int viewId) => IFrameElement()
  //       ..width = '800'
  //       ..height = '400'
  //       ..src = 'https://norbertkross.github.io/highLightCode.html'
  //       ..style.border = 'none'
  //       ); 


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