import 'package:flutter/material.dart';

class ClipMePath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
              clipper: NewClipperpath(context),
              child:   
              // Column(
              //   children: <Widget>[
                     Container(
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("facecoding.jpg"),
                           fit: BoxFit.fill
                         )
                       ),
                       //color: Colors.blueGrey,
                           height:MediaQuery.of(context).size.height*(50/100),
                          width: MediaQuery.of(context).size.width*(100/100)
                           ,),    
                         // ],
                        // ),
                       ),
                      );
                    }
                  }


class NewClipperpath extends CustomClipper<Path>{
  BuildContext context;
  NewClipperpath(this.context);

  @override
  Path getClip(Size size) {
    var path = Path();
    // TODO: implement getClip

    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;

    path.lineTo(0.0, mqh*(20/100));

    //first curve
    var fcp1 = Offset(mqw*(10/100), mqh*(20/100));
    var fep1 = Offset(mqw*(20/100), mqh*(30/100));

/// third curve
    var fcp2 = Offset(mqw*(90/100), mqh*(20/100));
    var fep2 = Offset(mqw, mqh*(20/100));

/// second // middle curve
/// increased the height of base of curve
    var fcp = Offset(mqw*(50/100), mqh*(60/100));
    var fep = Offset(mqw*(79/100), mqh*(30/100));

    path.quadraticBezierTo(fcp1.dx, fcp1.dy, fep1.dx, fep1.dy);
    path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy);
    path.quadraticBezierTo(fcp2.dx, fcp2.dy, fep2.dx, fep2.dy);
    
    path.lineTo(mqw, mqh*(30/100));
    path.lineTo(mqw, 0.0);
    path.lineTo(0.0, 0.0);
    


    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}