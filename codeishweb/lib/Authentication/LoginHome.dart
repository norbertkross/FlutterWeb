import 'package:codeishweb/Dialogues/holdDialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  Color bgColor = Color(0xFF070B39);
final TextEditingController _uNameController = TextEditingController();
String get nameCon => _uNameController.text.toString();

final TextEditingController _passwdController = TextEditingController();
String get passCon => _passwdController.text.toString();

final TextEditingController _emailController = TextEditingController();
String get emailCon => _emailController.text.toString();
Dio dio = Dio();
bool isValidName = false;
bool isValidEmail = false;
bool isLoading =false;
bool obscurate = true;
bool isLogin = true;
int available;
RegExp regExpMatch = 
RegExp(r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""");

String return_msg_to_show = "A proiblem Occured";


sprefGet()async{
SharedPreferences prefs = await SharedPreferences.getInstance();   
 available = (prefs.getInt("myKey") !=null?0:prefs.getInt("myKey"));
print(" 2. new prefs: $available");  
if(available != null){
  Navigator.of(context).pushNamed("/home");
}
}



loginUser()async{
Map<String,dynamic> postData = {
  "email":emailCon,
  //nameCon,
  "password":passCon,
  //passCon,
}; 
String apiUrl ="http://127.0.0.1/codeishweb/LoginUser.php";
var responseBody ;
print("Loading ......");
try{
setState(() {
  isLoading = true;
});


var resp = await http.post(Uri.encodeFull(apiUrl),
body: postData,
headers: {"Accept":"application/json"});
//var resp  = await http.get(apiUrl);

   if (resp.statusCode == 200){ 
      print("status code");
      //print(respon.data.toString());
      //return parseResData(response.data); 
      if(resp.body != null){
        print("not null");
       responseBody = jsonDecode(resp.body);
     //responseBody = json.decode(resp.data);
      print("results ::${responseBody}");
      setState(() {
        isLoading = false;
      return_msg_to_show = responseBody["_name"]=="INCORRECT CREDENTIALS"?"INCORRECT CREDENTIALS":"LOGIN SUCCESSFUL";
        
      });
      }else{
        setState(() {
          isLoading = false;
          return_msg_to_show ="Something went wrong";
        });        
        print("The request gave null");
      }
   } else { 
     print(resp.statusCode);
        setState(() {
          isLoading = false;
          return_msg_to_show ="Something went wrong";
        });
      print("should throw exception now");
      throw Exception('Unable to fetch products from the REST API');
   } 

}catch(e){
setState(() {
  isLoading = false;
  return_msg_to_show ="Something went wrong";
});
print("Exeption Thrown");
}

return responseBody;
}



signUpMethod()async{
Map<String,dynamic> postData = {
  "email":emailCon,
  //nameCon,
  "password":passCon,
  //passCon
  "name":nameCon,
};  
String apiUrl ="http://127.0.0.1/codeishweb/SignUp.php";
var responseBody ;

try{
setState(() {
  isLoading = true;
});

var resp = await http.post(Uri.encodeFull(apiUrl),
body: postData,
headers: {"Accept":"application/json"});
//var resp  = await http.get(apiUrl);

   if (resp.statusCode == 200) { 
      print("status code");
      //print(respon.data.toString());
      //return parseResData(response.data); 
      if(resp.body != null){
        print("not null");
       responseBody = jsonDecode(resp.body);
     //responseBody = json.decode(resp.data);
      print("results :: $responseBody");
      setState(() {
        isLoading = false;
      return_msg_to_show = responseBody["_Id"]=="USER ALREADY EXIST"?"USER ALREADY EXIST":responseBody["_name"];
      });      
      }else{
        setState(() {
          isLoading = false;
          return_msg_to_show ="Something went wrong";
        });        
        print("The request gave null");
      }
   } else { 
     print(resp.statusCode);
        setState(() {
          isLoading = false;
          return_msg_to_show ="Something went wrong";
        });     
      print("should throw exception now");
      throw Exception('Unable to fetch products from the REST API');
   }


}
catch(e){
setState(() {
  isLoading = false;
  return_msg_to_show ="Something went wrong";
});
}
return responseBody;
}


changesOnField(){ 
    print("Updated Text: $nameCon");
    if(
    nameCon.contains("@")||nameCon.contains("/")
    ||nameCon.contains(".")||nameCon.contains("?")
    ||nameCon.contains("\$")||nameCon.contains("%")
    ||nameCon.contains("^")||nameCon.contains("*")
    ||nameCon.contains("#")||nameCon.contains("(")
    ||nameCon.contains(")")||nameCon.contains("|")
    ||nameCon.contains("\\")||nameCon.contains("+")
    ||nameCon.contains("-")||nameCon.contains("(")
    ||nameCon.contains("&")
    ){
       isValidName = false; 
       }else{
         isValidName = true;
       }
    setState(() {}); // Will re-Trigger Build Method
  }

changesOn_Email_Field(){ 
    print("Updated Text: $emailCon");
    if( !regExpMatch.hasMatch(emailCon)){
       isValidEmail = false; 
       }else{
         isValidEmail = true;
       }
    setState(() {});
    }
    
    








  querySearcher(){
    print("Done!, Searching for results ....");
  }
  


@override
void initState() {
    // TODO: implement initState
    super.initState();
    _uNameController.addListener(changesOnField);
    _emailController.addListener(changesOn_Email_Field);
    sprefGet();
  }

  @override
  Widget build(BuildContext context) {
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;     
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
      padding: EdgeInsets.symmetric(horizontal: mwidth*.15,vertical:mheight*.1 ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: 
        Container(
          color: Colors.white,
          //elevation: 30,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
          children: <Widget>[
            SizedBox(height: 50,),
            CircleAvatar(
              child: Icon(Icons.person,color: Colors.white,),
              radius: 50,
              //backgroundColor: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),    
            Text(isLogin == true?"LOGIN":"REGISTER"),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                //horizontal: mwidth*.15,vertical:mheight*.1
                vertical: mheight*.01,
                horizontal: mwidth*.05,
              ),
              child: Column(
                children: <Widget>[

////////////////////////////////////////// Email Address //////////////////////////////////////////                      
 TextFormField(
        decoration:  InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(Icons.alternate_email),
            onPressed: null,
          ),                                              
          suffixIcon: IconButton(
            icon:emailCon.isEmpty?Icon(Icons.keyboard,color: Colors.redAccent.withOpacity(.6),):
            isValidEmail == true?Icon(Icons.done_all,color: Colors.green,):Icon(Icons.close,color: Colors.red,),
            onPressed:null,
          ),
          labelText: "Email",
          //fillColor: Colors.white,
          border:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.0),
            borderSide:  BorderSide(
            ),
          ),
        ),
        controller: _emailController,

        ),

    //////////////////////////////     userName     //////////////////////////////////////
    isLogin == false?SizedBox(height: 40,):SizedBox(height: 0,),
isLogin == false?      TextFormField(
        decoration:  InputDecoration(
          prefixIcon: 
          // IconButton(
          //   icon: 
            Icon(isLogin==true?Icons.person:Icons.person_add),                                             
          suffixIcon: IconButton(
            icon:nameCon.isEmpty?Icon(Icons.keyboard,color: Colors.redAccent.withOpacity(.6),):
            isValidName == true?Icon(Icons.done_all,color: Colors.green,):Icon(Icons.close,color: Colors.red,),
            onPressed:null,
          ),
          labelText: " Username ",
          //fillColor: Colors.white,
          border:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.0),
            borderSide:  BorderSide(
            ),
          ),
        ),
        controller: _uNameController,
        // onEditingComplete: (){
        //   querySearcher();
        // },
        ):Container(),

      SizedBox(height: 40,),

//////////////////////////////     Password     //////////////////////////////////////
      TextFormField(
        decoration:  InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(Icons.security),
            onPressed: null,
          ),                                              
          suffixIcon: IconButton(
            icon:obscurate ==true?Icon(Icons.visibility_off):Icon(Icons.visibility,color: Colors.red,),
            onPressed: (){
              //print("seaching");
              //querySearcher();
              setState(() {
                obscurate = !obscurate;
              });
              },
          ),
          labelText: " Password ",
          //fillColor: Colors.white,
          border:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10.0),
            borderSide:  BorderSide(
            ),
          ),
        ),
        controller: _passwdController,
        obscureText: obscurate,
        // onEditingComplete: (){
        //   querySearcher();
        // },
        ),



                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
      CupertinoButton(
        //borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.blue,
        onPressed:isLoading ==true?null:()async{
          if(isLogin == true){
            if(emailCon.isNotEmpty && passCon.isNotEmpty && isValidEmail==true){
             
              print("showing indicator");
             setState(() {
                isLoading = !isLoading;
             });
              loginUser().then((repsRes)async{
                if(repsRes['_name'] == "INCORRECT CREDENTIALS"){
          Navigator.of(context).push(
          PageRouteBuilder( opaque: false,pageBuilder: (BuildContext context,___, __){
                    return BaseAlertDialog(
                      yes: "OK",
                      content: "$return_msg_to_show",
                      noOnPressed: (){Navigator.pop(context);},
                      title: "@ ${repsRes !=null || repsRes.toString().isNotEmpty?repsRes['_name']:"INCORRECT"}",
                      yesOnPressed: (){},
                    );
                  }                      
            ));
                }else{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt("myKey", 1);
                await prefs.setString("repMoi", "${repsRes["_Id"].toString()}");
                print("_Id: ${repsRes["_Id"].toString()}");

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context)=>FrontPage()
                  // ));

                  Navigator.pushNamed(context, "/home");
                }
              });
             //return_msg_to_show ="Something went wrong";
            }else{
              // alert not field shoud be empty
              print("No field should be empty");

            Navigator.of(context).push(
          PageRouteBuilder( opaque: false,pageBuilder: (BuildContext context,___, __){
                    return BaseAlertDialog(
                      yes: "OK",
                      content: "Please fill all fields.\nMake sure the email or name are properly formatted",
                      noOnPressed: (){},
                      title: "@from Codeish",
                      yesOnPressed: (){Navigator.pop(context);},
                    );
                  }                      
            ));
            }
          }
  /// For Registration SIGNUPPannel 
        else{
          if(emailCon.isNotEmpty && passCon.isNotEmpty && nameCon.isNotEmpty && isValidEmail==true && isValidName==true){
            //signUpMethod();
              setState(() {
                isLoading = !isLoading;
             });
              signUpMethod().then((repsRes){
          Navigator.of(context).push(
          PageRouteBuilder( opaque: false,pageBuilder: (BuildContext context,___, __){
                    return BaseAlertDialog(
                      yes: "OK",
                      content: "$return_msg_to_show",
                      noOnPressed: (){Navigator.pop(context);},
                      title: "@ ${repsRes !=null || repsRes.toString().isNotEmpty?repsRes['_name']:"INCORRECT"}",
                      yesOnPressed: (){Navigator.pop(context);},
                    );
                  }                      
            ));
              });
          }else{
            // alert not field shoud be empty
            print("No field should be empty");
              Navigator.of(context).push(
 PageRouteBuilder( opaque: false,pageBuilder: (BuildContext context,___, __){
          return BaseAlertDialog(
            yes: "OK",
            content: "Please fill all fields.\nMake sure the email or name are properly formatted",
            noOnPressed: (){Navigator.pop(context);},
            title: "@from Codeish",
            yesOnPressed: (){Navigator.pop(context);},
          );
        }                      
      ));
    }
  }
},
    child:isLoading == true?
    CircularProgressIndicator():Text(isLogin == true?"Login":"Register",style: TextStyle(fontSize: 25),),
                              )
                              //.showCursorOnHover
                              ,
                         SizedBox(height: 15,),
                         GestureDetector(
                           onTap: (){
                             setState(() {
                               isLogin = !isLogin;
                             });
                           },
                           child:isLogin == true?Text("Don't Have an Account? Register",
                           style: TextStyle(color: Colors.blue),):
                           Text("Already Have an Account? Login",
                           style: TextStyle(color: Colors.blue),)
                           ,
                         ),
                         SizedBox(
                                height: 50,
                              ), 
                            ],
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}