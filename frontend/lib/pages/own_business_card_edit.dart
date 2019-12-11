import 'package:cardy_b/colors.dart';
import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:cardy_b/widget/app_bar.dart';
import 'package:flutter/material.dart';

class BusinessCardEditScreen extends StatefulWidget {
  @override
  State createState() => _BusinessCardEditScreenState();
}

class _BusinessCardEditScreenState extends State<BusinessCardEditScreen> {
  @override
  Widget build(BuildContext context) {
    Participant p = Database().participants[AppState().userid];

  }
}
