import 'dart:collection';

import 'package:cardy_b/logic/business_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardAttribute extends StatelessWidget {
  final String type;
  final String value;
  final Color color;

  CardAttribute(this.type, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    var icon;
    switch (this.type) {
      case 'linkedIn':
        icon = FontAwesomeIcons.linkedin;
        break;
      case 'twitter':
        icon = FontAwesomeIcons.twitter;
        break;
      case 'company':
        icon = FontAwesomeIcons.building;
        break;
      case 'position':
        icon = FontAwesomeIcons.medal;
        break;
      case 'website':
        icon = Icons.public;
        break;
      case 'gitHub':
        icon = FontAwesomeIcons.github;
        break;
      case 'email':
        icon = Icons.email;
        break;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Expanded(child: Text('  ' + this.value, style: TextStyle(color: color)))
      ],
    );
  }
}

class CardAttributeDisplay extends StatelessWidget {
  final LinkedHashMap<String, String> fields;
  final Color color;

  CardAttributeDisplay(this.fields, this.color);

  @override
  Widget build(BuildContext context) {
    var attributes = List<Widget>.from(fields.entries
        .map((entry) => CardAttribute(entry.key, entry.value, color)));
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: attributes);
  }
}

class BusinessCardWidget extends StatelessWidget {
  final BusinessCard card;

  BusinessCardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    var photoSize = 0.15 * MediaQuery
        .of(context)
        .size
        .height;
    var photo = card.photo != null
        ? Container(
            padding: EdgeInsets.all(0.02 * MediaQuery.
                of(context).
                size.
                height),
            height: photoSize,
            width: photoSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(card.photo),
            ),
          )
        : null;

    var name = Text(
      card.name, style: TextStyle(color: card.foreground, fontSize: 18),);
    var attributes = CardAttributeDisplay(card.fields, card.foreground);
    var rightColumn = Padding(
      padding: EdgeInsets.all(MediaQuery
          .of(context)
          .size
          .height * 0.01),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            name,
            Expanded(child: attributes),
          ]),
    );

    var content = photo != null
        ? [photo, Expanded(child: rightColumn)]
        : [Expanded(child: rightColumn)];

    return Card(
      elevation: 12,
      color: card.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(0.05 * MediaQuery.of(context).size.width),
      child: Container(
          width: 0.9 * MediaQuery.of(context).size.width,
          height: 0.3 * MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Row(children: content)),
    );
  }
}
