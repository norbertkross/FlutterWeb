import 'package:codeishweb/CheckScreenQuery/frequentFuncts.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as uh;
import 'dart:js'as js;


class AvailableArticles extends StatefulWidget {
  @override
  _AvailableArticlesState createState() => _AvailableArticlesState();
}

class _AvailableArticlesState extends State<AvailableArticles> {
String id;

Color bgColor = Color(0xFF070B39);
Color cardColor = Color(0xff202021);

Widget lstCard(){
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, '/articles/norbertaberor');
    },
      child: Card(
      color: Colors.white.withOpacity(.2),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("facecoding.jpg"),//NetworkImage("url"),
        ),
        title: Text("\nTitle Of The Message Goes Here ",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[        
            Text("\n${"6"} mins read",style: TextStyle(color: Colors.white,),),
            Text("Author : $id & Sundar Pichai",style: TextStyle(color: Colors.white,)),
            Text("12-04-1993  ||  12:15 pm",style: TextStyle(color: Colors.white,)),
          ],
        ),
      ),
    ),
  );
}

@override
void initState() { 
  super.initState();
}

  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;    
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: <Widget>[
          Center(
            child:Stack(
              children: <Widget>[
                ClipPath(
                  clipper: FolderTopClipper(context),
                  child:Column(
                        children: <Widget>[
                            Container(
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   colors: [
                                     //Color(0xFF3e89c2),
                                     Colors.deepOrange,
                                     Colors.green
                                    // Color(0xFF446cb7),                     
                                   ]
                                 )
                               ),
                                height:MediaQuery.of(context).size.height*(40/100),
                                width: MediaQuery.of(context).size.width*(100/100),
                              ),
                        ],
                      ),
                 ),
                     Padding(
                       padding: EdgeInsets.only(left: mwidth*.15,top:mheight*.05 ),
                       child: GestureDetector(
                         onTap: (){
                          
                          Navigator.pushNamed(context, '/write-article');

                         },
                         child: Icon(Icons.mode_edit,color: Colors.white,size: 100,)),
                     ),
              ],
            ),            
          ),

          ListView.builder(
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context,index){
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal:
                Freqnt().isWeb(context)==true?mwidth*.2:10),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: lstCard(),
                ),
                  );
            },
          ),
            
          
        ],
      ),
    );
  }
}


//Folder clipper class
class FolderTopClipper extends CustomClipper<Path>{
  final context;
  FolderTopClipper(@required this.context);

  @override

  Path getClip(Size size){

    var path = Path();

   path.lineTo(0.0, MediaQuery.of(context).size.height*(30/100) );

   var firstControlPoint = Offset(size.width/4, MediaQuery.of(context).size.height*(38/100));
   var secondControlPoint = Offset(size.width * .75, MediaQuery.of(context).size.height*(10/100));
   var firstEndPoint = Offset(size.width/2.5, MediaQuery.of(context).size.height*(30/100));
   var secondEndPoint = Offset(size.width, MediaQuery.of(context).size.height*(12/100));

   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, MediaQuery.of(context).size.height*(12/100));

    path.lineTo(size.width, 0.0);

    path.close();

    return path;

  }

 @override 
 bool shouldReclip(CustomClipper<Path> oldCliper)=>false;
}