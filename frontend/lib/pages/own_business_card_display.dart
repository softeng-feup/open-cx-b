import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/business_card.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/widgets/app_bar.dart';
import 'package:cardy_b/widgets/business_card.dart';
import 'package:cardy_b/pages/own_business_card_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBusinessCardDisplayPage extends StatelessWidget {
  final BusinessCard card;

  MyBusinessCardDisplayPage()
      : card = BusinessCard.fromParticipant(
      Database().getParticipantById(AppState().userid));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        //resizeToAvoidBottomPadding: true,
        appBar: CardyBAppBar(pageTitle: 'My Business Card'),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              BusinessCardWidget(card),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context1) => BusinessCardEditScreen()));
                },
                child: Text('Edit Business Card',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black)),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: 0.01 * MediaQuery
                          .of(context)
                          .size
                          .height),
                  width: 0.55 * MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 0.08 * MediaQuery
                      .of(context)
                      .size
                      .height,
                  //color: Colors.black,
                  child: DropDown())
            ]
        )
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {
  String dropdownValue = 'Send Card by QR Code';
  List<String> spinnerItems = [
    'Send Card by QR Code',
    'Send Card by NFC',
    'Send Card by Link'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Center(
          child: Column(children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 32,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              underline: Container(
                color: Colors.black,
                height: 1,
              ),
              onChanged: (String data) {
                setState(() {
                  dropdownValue = data;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ]),
        )
    );
  }
}


