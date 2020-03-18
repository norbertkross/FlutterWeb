// extends from MainModule
import 'package:codeishweb/Chats/ChatRoomMain.dart';
import 'package:codeishweb/Courses/courses.dart';
import 'package:codeishweb/FrontHome/FrontPage.dart';
import 'package:codeishweb/Lessons/lessons.dart';
import 'package:codeishweb/Notifications/NotificationsBoard.dart';
import 'package:codeishweb/WebArticles/DetailsOfArticle.dart';
import 'package:codeishweb/WebArticles/articlsScreenFront.dart';
import 'package:codeishweb/WebArticles/writeArticles.dart';
import 'package:codeishweb/main.dart';
import 'package:flutter/material.dart';

// Modular Package
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
      Router("/", child: (_, args) => FrontPage()),
      Router("/messages", child: (_, args) => ChatroomMain()),  
      Router("/notifications", child: (_, args) => NotifyUsers()),
      Router("/lessons", child: (_, args) => Lessons()),  
      Router("/write-article", child: (_, args) => WriteArticles()),
      Router("/courses", child: (_, args) => Courses()),      
      // Router("/courses", child: (_, args) => TypeCompose()),
      Router("/all-articles", child: (_, args) => AvailableArticles()), 
      Router("/articles/:id", child: (_, args) => DetailsOfArticle(theId: args.params['id'])),
  
  ];

// add your main widget here
  @override
  Widget get bootstrap => MyApp();
}