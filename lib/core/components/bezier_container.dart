import 'package:flutter/material.dart';

class BezierContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
      angle: 0,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff252880), Color(0xff252850)])),
        ),
      ),
    ));
  }
}

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    //var firstControlPoint = Offset(-10, size.height / -10);
    //var firstEndPoint = Offset(size.width / 1.5, size.height / 1.3);
    //path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //    firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width, size.height - 10);
    var secondEndPoint = Offset(size.width, size.height / 2.4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
