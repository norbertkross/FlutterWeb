import 'package:codeishweb/Dialogues/tagsDialog.dart';
import 'package:flutter/material.dart';

class HoldDialogs{
  BuildContext context;
HoldDialogs({this.context});
giveDialgue1(String head,String body,bool cancelMe){
  showDialog(
    context: context,
    builder:(content){
     return AlertDialog(
        title:Text("@from Codeish \n$head") ,
        content: Text("$body"),
        actions: <Widget>[
          RaisedButton(
            child: Text("OK"),
            onPressed: (){Navigator.pop(context);},
          ),
          // cancelMe == true?RaisedButton(
          //   child: Text("Cancel"),
          //   onPressed: (){Navigator.pop(context);},
          // ):Container(),          
        

        ]);}
    
  );
}

    Widget  popupMenuButton(){
      String tagEm = '\u{1F51D}';
      String vidEm = '📹';
      String chatEm = '\u{1F3AB}';
      String writeEm = '\u{270D}';
      String allArtEm = '\u{231A}';
      String sampPEm = '\u{1F30C}';
      String allProEm = '\u{1F320}';
      return PopupMenuButton<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        icon: Icon(Icons.library_books,color: Colors.white,size: 35,),
         itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//// String emojies for emojies 
/// https://emojipedia.org/
/// UniCode Characters [3D https://unicode.org/emoji/charts/full-emoji-list.html ,2D https://apps.timwhitlock.info/emoji/tables/unicode]
               PopupMenuItem<String>(
                value:
                'tags',
                child:
               // Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),
                Text(
                  '$tagEm #Top Tags '
                  ,style: TextStyle(color: Colors.green),
                  ),
                 // ],),  
              ),

               PopupMenuItem<String>(
                value:
                'videos',
                child:
                //Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),
                Text(
                  '$vidEm Videos'
                  ,style: TextStyle(color: Colors.green),),
                  //],),  
              ), 

               PopupMenuItem<String>(
                value:
                'chat',
                child:
                //Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),
                Text(
                  '$chatEm Chat'
                  ,style: TextStyle(color: Colors.green),),
                  //],),  
              ),              

               PopupMenuItem<String>(
                value:
                'wArticles',
                child:
               // Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),
                Text(
                  '$writeEm Article'
                  ,style: TextStyle(color: Colors.green),),
                 // ],),  
              ),

               PopupMenuItem<String>(
                value:
                'aArticles',
                child:
                //Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),
                Text(
                  '$allArtEm All Articles'
                  ,style: TextStyle(color: Colors.green),),
                  //],),  
              ),

               PopupMenuItem<String>(
                value:
                'sProjects',
                child:
                //Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),
                Text(
                  '$sampPEm Sample Projects'
                  ,style: TextStyle(color: Colors.green),),
                 // ],),  
              ),                            


               PopupMenuItem<String>(
                value:
                'usProjects',
                child:
                //Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),
                Text(
                  '$allProEm Upload Sample Projects'
                  ,style: TextStyle(color: Colors.green),),
                 // ],),  
              ), 

            ],
            onSelected: ( result) {
              print(result);
              switch (result){
                case 'tags': {
                print("Tags Taped");
  Navigator.of(context).push(
 PageRouteBuilder( opaque: false,pageBuilder: (BuildContext context,___, __){
          return TagsDialog();
                      }
                      
   )); 
                }
                break; 
                case 'videos':{
                  Navigator.pushNamed(context, '/lessons');
                
                }
                break;
                case 'chat':{
                  Navigator.pushNamed(context, '/messages');

                }
                break;
                case 'wArticles':{
                  Navigator.pushNamed(context, '/write-article');

                }
                break;
                case 'aArticles':{
                  //Navigator.pushNamed(context, '/articles/NorbertKrossAberor');
                  Navigator.pushNamed(context, '/all-articles');
                }
                break;
                case 'sProjects':{

                }
                break;
                case 'usProjects':{

                }
                break;   
                                                                              
              }              

              },
          );
    }


}




class BaseAlertDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Color.fromARGB(220, 117, 218 ,255);

  String _title;
  String _content;
  String _yes;
  String _no;
  Function _yesOnPressed;
  Function _noOnPressed;

  BaseAlertDialog({String title, String content, Function yesOnPressed, Function noOnPressed, String yes = "Yes", String no = "No"}){
    this._title = title;
    this._content = content;
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;
    this._yes = yes;
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(.7),
        body: AlertDialog(
          title: Text(this._title,style: TextStyle(color: Colors.blueGrey.withOpacity(.5)),),
          content: Text(this._content),
          backgroundColor: this._color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: <Widget>[
            //  FlatButton(
            //   child: Text(this._no),
            //   textColor: Colors.greenAccent,
            //   onPressed: () {
            //     this._noOnPressed();
            //   },
            // ),
             FlatButton(
              child: Text(this._yes),
              textColor: Colors.redAccent,
              onPressed: () {
                this._yesOnPressed();
              },
            ),
          ],
        ),
      ),
    );
  }
}