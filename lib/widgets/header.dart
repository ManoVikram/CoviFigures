import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/infoScreen.dart';

import '../config/constants.dart';

class Header extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;

  const Header({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 350.0,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 40.0,
          top: 50.0,
          right: 10.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/virus.png",
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InfoScreen(),
                    ),
                  );
                },
                child: SvgPicture.asset("assets/icons/menu.svg"),
              ),
            ), */
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  SvgPicture.asset(
                    image,
                    width: 230.0,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                  Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      "$textTop\n$textBottom",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    /* child: AutoSizeText(
                      "$textTop\n$textBottom",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                      minFontSize: 18,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ), */
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
