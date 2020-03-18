/* Copyright (C) Code-Ish, LLC - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Aberor Norbert Eugene <norbertaberor@gmail.com>, June 2019
 */

/*
Developer with passion and soul, working everyday to be a better developer.

A bug is never just a mistake

It represents something bigger

An error of thinking

That makes you who you are


Apparently, this user prefers to keep an air of mystery about them.

Farhana... The only way of writing fewer bugs is writing less code.

*/




import 'package:codeishweb/FrontHome/FrontPage.dart';
import 'package:codeishweb/Navigations/app_module.dart';
import 'package:codeishweb/imageFrontUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


void main() => runApp(ModularApp(module: AppModule()));


class MyApp extends StatelessWidget {

  Map routes = <String, WidgetBuilder>{
    //"/": (context)=> FrontPage(),
    "/": (context)=> FrontUi(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Code-Ish {:}',
      theme: ThemeData(
        accentColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      home:
      FrontPage(),
      //FrontUi(),
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
