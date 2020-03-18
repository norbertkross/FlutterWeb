import 'package:flutter/material.dart';

class TagsDialog extends StatefulWidget {
  @override
  _TagsDialogState createState() => _TagsDialogState();
}

class _TagsDialogState extends State<TagsDialog> {
 List items = ["Hello package","qwrer rtthesr Can","gbwvhbfkv","package dart","Me","As","I","Scream","Your","Name"];  
 Color bgColor = Color(0xFF070B39);
 bool isHorizontal(){
   bool horizon = true;
   if(MediaQuery.of(context).size.width>MediaQuery.of(context).size.height){
// horizontal
horizon = true;
return horizon;
   }else{
// portrait
horizon = false;
return horizon;
   }
 }
  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height; 
    return GestureDetector(
      onTap: (){
      print("Tapped");
      Navigator.of(context).pop(); 
      },
          child: Scaffold(
       backgroundColor: Colors.black.withOpacity(.5),
            body: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
          child: Container(
          width:isHorizontal()==true?mwidth*.7:mwidth*.8,
          height:isHorizontal()==true?mheight*.8:mwidth*.7,
          color:bgColor,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Tags",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white70)),
      
                for (var i =0; i<=items.length-1;i++) RaisedButton(
                  onPressed: (){},
                  color: i%2==0?Colors.green:Colors.deepOrange,
                  child: Text("# ${items[i]!=null?items[i]:'waiting ...'} "),
                ),
                ],
              )
            ],
          ),
                    
        ),
              ),
            ),
      ),
    );
  }
}