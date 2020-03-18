import 'dart:typed_data';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:web_image_upload/impUp.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

class FrontUi extends StatefulWidget {
  @override
  _FrontUiState createState() => _FrontUiState();
}

class _FrontUiState extends State<FrontUi> {

Uint8List uploadedImage;
File theChosenImg;
String dispText = 'Uploaded image should shwo here.';
FileReader reader2 = FileReader();

String name = '';
String error;
Uint8List data;






_startFilePicker() async {
InputElement uploadInput = FileUploadInputElement();
uploadInput.click();


uploadInput.onChange.listen((e) {
  // read file content as dataURL
  final files = uploadInput.files;
  if (files.length == 1) {
    final file = files[0];
    FileReader reader =  FileReader();

    reader.onLoadEnd.listen((e) {
                setState(() {
                  uploadedImage = reader.result;
                  //theChosenImg = files[0];
                  print("reder result: ${files[0].relativePath}");
                });
    });
    reader.readAsArrayBuffer(file);
    reader2.readAsDataUrl(file);

  }
});
}




////// second Picker method

  pickImage() {
    final InputElement input = document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';
    input.onChange.listen((e) {
      if (input.files.isEmpty) return;
      final reader = FileReader();
      reader.readAsDataUrl(input.files[0]);
      reader.onError.listen((err) => setState(() {
            error = err.toString();
          }));
      reader.onLoad.first.then((res) {
        final encoded = reader.result as String;
        // remove data:image/*;base64 preambule
        final stripped =
            encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');

        setState(() {
          name = input.files[0].name;
          data = base64.decode(stripped);

          error = null;
        });
      });
    });

    input.click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 500,
                  width: 800,
                  child: Center(
                    child: uploadedImage == null
                ? Container(
                    child: Text(dispText),
                  )
                : Container(
                    child: Image.memory(uploadedImage),
                  ),
                  ),
                ),
            SizedBox(height: 20,),                
                CupertinoButton(
                  color: Colors.green,
                  child: Text("Choose"),
                  onPressed: (){
                    _startFilePicker();
                  },
                ),

            SizedBox(height: 50,),
             CupertinoButton(
              color: Colors.green,
              child: Text("Upload"),
              onPressed: (){
                //PhotoCls().upload(reader2.result);
              },
            ),



              ],
            ),



          ],
        ),
      ),
      
    );
  }
}