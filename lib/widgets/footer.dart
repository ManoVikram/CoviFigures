import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  final Function urlLauncher;

  const Footer({
    Key key,
    @required this.urlLauncher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Made in 🇮🇳 with ❤️ by Mano Vikram",
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Wrap(
          spacing: 30.0,
          runSpacing: 30.0,
          children: [
            InkWell(
              onTap: () {
                urlLauncher("https://github.com/ManoVikram");
              },
              child: FaIcon(
                FontAwesomeIcons.github,
                color: Colors.blueGrey,
              ),
            ),
            InkWell(
              onTap: () {
                urlLauncher("https://twitter.com/ManoVik18");
              },
              child: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.indigoAccent,
              ),
            ),
            InkWell(
              onTap: () {
                urlLauncher("https://www.instagram.com/themanovik18/");
              },
              child: FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
