import 'package:cardy_b/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardyBAppBar extends AppBar {
  CardyBAppBar({String pageTitle})
      : super(
            backgroundColor: CardyBColors.Accent,
            title: Row(children: [
              SvgPicture.asset('images/white_logo.svg',
                  semanticsLabel: 'Cardy B Logo', color: Colors.white),
              Text('  ' + (pageTitle ?? 'Cardy B'))
            ]));
}
