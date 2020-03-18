import 'dart:html';

import 'package:codeishweb/CheckScreenQuery/frequentFuncts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotifyUsers extends StatefulWidget {
  @override
  _NotifyUsersState createState() => _NotifyUsersState();
}

class _NotifyUsersState extends State<NotifyUsers> {
bool showThatWIdget = false;
bool awaitingData =true;




@override
void initState() { 
  super.initState();
  //print("poster value ${widget.posterID}");
}
  @override
  Widget build(BuildContext context) {
     
  final ScreenArguments scrnArgs = ModalRoute.of(context).settings.arguments;
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;   

Future<List>getdata()async{

print("Loading ....");
String theUrl ="http://127.0.0.1/codeishweb/notifiedUser.php";
var res = await http.post(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"},
body: {"notID":scrnArgs.query});

var responseBody = json.decode(res.body);

print("results ::\n\n$responseBody\n\n");

 return responseBody;
}



    return Scaffold(
      backgroundColor: Colors.greenAccent,

      body:  scrnArgs == null|| scrnArgs.query.isEmpty? Center(
        child: Text("Please Login To See Your Notifications.\nThank You.",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
      ):
      FutureBuilder(
      future:getdata() ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        ConnectionState  conn = snapshot.connectionState;

        if(conn == ConnectionState.none){
          return Container(color: Colors.blueGrey.withOpacity(.7),);
        }
        if(conn == ConnectionState.waiting){
            return Center(
                child:Center(child:awaitingData == true?CircularProgressIndicator():Container(),)
              ) ;
        }
        if(snapshot.hasError){
             // return Center(child:Text('Check Your Connection ${snapshot.error}') ,) ;
             return Center(child:Text('Could Not Connect ',style: TextStyle(color: Colors.green),) ,) ;
        }else{
          List snapData = snapshot.data;
         return ListView.builder(
             itemCount: snapData.length,
             itemBuilder: (context,index){
  
              return  Padding(
               padding: EdgeInsets.symmetric(
                 horizontal: Freqnt().isWeb(context)==true? mwidth*.2:mwidth*.1,
               ),
                child:index == 0?Hidden2(
                  body: snapData != null ? snapData[index]["body_of"]: 'Could Not Load Content',
                  heading: snapData != null ? snapData[index]["heading"]: 'Could Not Load Content',
                  date: snapData != null ? snapData[index]["date"]: 'error',
                  time: snapData != null ? snapData[index]["time"]: 'error',                  
                ):Hidden_Class(
                  body: snapData != null ? snapData[index]["body_of"]: 'Could Not Load Content',
                  heading: snapData != null ? snapData[index]["heading"]: 'Could Not Load Content',
                  date: snapData != null ? snapData[index]["date"]: 'error',
                  time: snapData != null ? snapData[index]["time"]: 'error',
                ),
              );    

             },
           );
        }
      },
    ),
    );
  }
}





class Hidden_Class extends StatefulWidget {
String date;
String time;
String heading;
String body;
Hidden_Class(
  {
    this.body,
    this.date,
    this.heading,
    this.time
  }
);

  @override
  _Hidden_ClassState createState() => _Hidden_ClassState();
}

class _Hidden_ClassState extends State<Hidden_Class> {
  bool showThatWIdget = false;

  @override
  Widget build(BuildContext context) {

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Column(
      children: <Widget>[
                  Container(
                    //color: Colors.red,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:8),
                          child: Card(                                          
                            child: ListTile(
                                contentPadding: EdgeInsets.fromLTRB(
                                  16,showThatWIdget==true?70:50,16,8
                                ),
                                title: Text(" "),
                                trailing: Icon(Icons.notifications_active),
                                subtitle: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[



                                    showThatWIdget==true? Text("${widget.heading}",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.green),):Container(),


                                      Text("\n${widget.date}   ||  ${widget.time}",style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green),),

                                    SizedBox(height: 20,),

                                    showThatWIdget==true?Text("${widget.body}\n\n")
                                    :Container(),
                                   showThatWIdget==true? ClipRRect(
                                     borderRadius: BorderRadius.circular(30),
                                     child: Container(
                                        color: Colors.brown,
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                      ),
                                   ):Container(),
                                  ],
                                ),                                    
                              ),
                          ),
                        ),                                
                        Card(
                          elevation: 20,
                          child: ListTile(
                            onTap: (){
                              setState(() {
                                showThatWIdget = !showThatWIdget;
                              });
                            },
                            title: Text("\n${widget.date}   ||  ${widget.time}"),
                            trailing: Icon(Icons.mode_comment,color: Colors.green,),
                            subtitle: Text("\n${widget.heading}\n"),                                    
                          ),
                        ),
                    ],
                  ),
                ),
      ],
    ),
  );
  }
}








class Hidden2 extends StatefulWidget {
String date;
String time;
String heading;
String body;
Hidden2(
  {
    this.body,
    this.date,
    this.heading,
    this.time
  }
);  
  @override
  _Hidden2State createState() => _Hidden2State();
}

class _Hidden2State extends State<Hidden2> {
bool showThatWIdget = true;

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Column(
      children: <Widget>[
                  Container(
                    //color: Colors.red,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:8),
                          child: Card(                                          
                            child: ListTile(
                                contentPadding: EdgeInsets.fromLTRB(
                                  16,showThatWIdget==true?70:30,16,8
                                ),
                                title: Text(" "),
                                trailing: Icon(Icons.notifications_active),
                                subtitle: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[



                                    showThatWIdget==true? Text("${widget.heading}",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.green),):Container(),


                                      Text("\n${widget.date}   ||  ${widget.time}",style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green),),

                                    SizedBox(height: 20,),

                                    showThatWIdget==true?Text("${widget.body}\n\n")
                                    :Container(),
                                   showThatWIdget==true? ClipRRect(
                                     borderRadius: BorderRadius.circular(30),
                                     child: Container(
                                        color: Colors.brown,
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                      ),
                                   ):Container(),
                                  ],
                                ),                                    
                              ),
                          ),
                        ),                                
                        Card(
                          elevation: 20,
                          child: ListTile(
                            onTap: (){
                              setState(() {
                                showThatWIdget = !showThatWIdget;
                              });
                            },
                            title: Text("\n${widget.date}   ||  ${widget.time}"),
                            trailing: Icon(Icons.mode_comment,color: Colors.green,),
                            subtitle: Text("\n${widget.heading}\n"),                                    
                          ),
                        ),

                    ],
                  ),
                ),
      ],
    ),
  );
  }
}



// add foreign key to login table this should help me get the id
// ALTER TABLE user_notifications ADD FOREIGN KEY (frn_to_loging) REFERENCES login_tb (_id)



class ScreenArguments {
  final String query;
  
  ScreenArguments(this.query);
}

