import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardyBAppBar extends AppBar {
  CardyBAppBar()
      : super(
            backgroundColor: Color.fromARGB(255, 180, 0, 0),
            title: Row( children: [SvgPicture.asset('images/white_logo.svg',
                semanticsLabel: 'Cardy B Logo', color: Colors.white),
            Text('  Cardy B')]));
}
