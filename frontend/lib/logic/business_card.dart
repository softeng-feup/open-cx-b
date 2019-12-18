import 'dart:collection';

import 'package:cardy_b/colors.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:flutter/material.dart';

class BusinessCard {
  Color background;
  Color foreground;
  String name;
  String photo;
  Map<String, String> fields;

  BusinessCard.fromParticipant(Participant p) {
    this.background = (p.bgRed != null && p.bgGreen != null && p.bgBlue != null)
        ? Color.fromARGB(255, p.bgRed, p.bgGreen, p.bgBlue)
        : CardyBColors.Accent;
    this.foreground = (p.fgRed != null && p.fgGreen != null && p.fgBlue != null)
        ? Color.fromARGB(255, p.fgRed, p.fgGreen, p.fgBlue)
        : Colors.white;
    this.photo = p.photo;
    this.name = p.name;
    this.fields =
    LinkedHashMap<String, String>.fromEntries(p.cardAttributes.map((field) {
      switch (field) {
        case 'email':
          return MapEntry(field, p.email);
        case 'company':
          return MapEntry(field, p.company);
        case 'position':
          return MapEntry(field, p.position);
        case 'website':
          return MapEntry(field, p.website);
        case 'linkedIn':
          return MapEntry(field, p.linkedIn);
        case 'gitHub':
          return MapEntry(field, p.gitHub);
        case 'twitter':
          return MapEntry(field, p.twitter);
      }
      return MapEntry(field, '');
    }));
  }
}
