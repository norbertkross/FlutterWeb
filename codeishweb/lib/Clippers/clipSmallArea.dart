import 'package:flutter/material.dart';

/// custum cliped designed by Moi


class ClipSmallArea extends StatefulWidget {
  String imageHere;
  ClipSmallArea(this.imageHere);
  @override
  _ClipSmallAreaState createState() => _ClipSmallAreaState();
}

class _ClipSmallAreaState extends State<ClipSmallArea> {
  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;    
    return ClipPath(
      clipper: CustomClipperpath(context),
      child: ClipRRect(
              borderRadius:  BorderRadius.horizontal(left: Radius.circular(30)),
              child: Container(
                //color: Colors.black,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.imageHere)
                  )
                ),
                width: mwidth*.20,
                height: mheight * .5,
              ),
            ),
    );
  }
}





////////////////////////////  Custom Bottom Clipper  /////////////////////////


class CustomClipperpath extends CustomClipper<Path>{
  BuildContext context;
  CustomClipperpath(this.context);

  @override
  Path getClip(Size size) {
    var path = Path();
    // TODO: implement getClip
    
    var mh = size.height;
    var mw = size.width;    
//  First Curve maybe 
    var fcp = Offset(mw/4.5, mh);
    var fep = Offset(size.width, mh*.45);

 
  path.moveTo(0.0, 30.0);
  path.lineTo(0.0, mh*.4);
  path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy);  
  path.lineTo(size.width, mh*.4);
  path.lineTo(size.width, 0.0);
  path.lineTo(0.0,0.0);  

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
