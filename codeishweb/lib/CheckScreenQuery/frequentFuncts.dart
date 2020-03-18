import 'package:flutter/material.dart';

class Freqnt{
  bool isWeb(BuildContext context){
    bool isWebD = false;
    if(MediaQuery.of(context).size.width>=510){
      isWebD = true;
      return isWebD;
    }else{
      isWebD = false;
      return isWebD;
    }      
    }  
}