import 'package:cardy_b/colors.dart';
import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/pages/own_profile_edit.dart';
import 'package:cardy_b/widgets/app_bar.dart';
import 'package:cardy_b/widgets/profile_display.dart';
import 'package:flutter/material.dart';

class OwnProfileDisplayPage extends StatelessWidget {
  final int _userId = AppState().userid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: CardyBAppBar(pageTitle: 'My Profile'),
      body: Stack(
        children: <Widget>[ProfileDisplay(_userId)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context1) => ProfileEditScreen()));
        },
        tooltip: 'Edit Profile',
        child: Icon(Icons.edit),
        backgroundColor: CardyBColors.Accent,
      ),
    );
  }
}
