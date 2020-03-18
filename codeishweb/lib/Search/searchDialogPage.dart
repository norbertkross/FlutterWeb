import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
final TextEditingController _controller = TextEditingController();
String get conValue => _controller.text.toString();

  changesOnField() { 
    print("Updated Text: $conValue");
    setState(() {}); // Will re-Trigger Build Method
  }

  querySearcher(){
    print("Done!, Searching for results ....");
  }

@override
void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(changesOnField);
  }

  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;     
    return Scaffold(
    backgroundColor: Colors.black87,
    body: 
              GestureDetector(
                onTap: (){Navigator.pop(context);},
                              child: Container(
                      child: Center(
                        child:ListView(
                          children: <Widget>[
                            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mwidth*.1,vertical:mheight*.45 ),
              child:Column(
                children: <Widget>[
                  Center(child:conValue.isEmpty?Text("'Search'",style: TextStyle(color: Colors.white70,fontSize: 30),):
                  Text(" $conValue",style: TextStyle(color: Colors.white,fontSize: 30),)),
                  SizedBox(height: 20,),
                  Card(
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      // child: Text("Coming Soon ...",style: TextStyle(color: Colors.red,fontSize: 40,fontWeight: FontWeight.bold),),
                      child: TextFormField(
                      decoration:  InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),                                              
                        suffixIcon: IconButton(
                          icon: Icon(CupertinoIcons.search),
                          onPressed: (){
                            //print("seaching");
                            querySearcher();
                            
                            },
                        ),
                        labelText: " Search ",
                        //fillColor: Colors.white,
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(10.0),
                          borderSide:  BorderSide(
                          ),
                        ),
                      ),
                      controller: _controller,
                      onEditingComplete: (){
                        querySearcher();
                      },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: (){
                        Navigator.pop(context);
                        },
                        child: Text("Close"),
                      )
                    ],
                  )
                ],
              ),
            )
                             
                          ],
                        )),
                ),
              ),     
    );
  }
}