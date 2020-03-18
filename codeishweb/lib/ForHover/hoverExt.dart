// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'dart:html' as html;


// extension HoverExtensions on Widget{
//   static final appContainer = html.window.document.getElementById("app-container");

//   Widget get showCursorOnHover {
//     return MouseRegion(
//       child: this,
//       onHover: (event){
// return appContainer.style.cursor ="pointer";
//       },
//       onExit: (event)=>appContainer.style.cursor = 'default',
//     );
//   }
// }








// // class HandCursor extends Listener {
// //   static final appContainer = html.window.document.getElementById('app-container');
// //   HandCursor({Widget child}) : super(
// //     onPointerHover: (PointerHoverEvent evt) {
// //       appContainer.style.cursor='pointer';
// //     },
// //     onPointerExit: (PointerExitEvent evt) {
// //       appContainer.style.cursor='default';
// //     },
// //     child: child
// //   );
// // }