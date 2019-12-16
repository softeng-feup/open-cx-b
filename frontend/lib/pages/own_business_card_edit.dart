import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:cardy_b/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class BusinessCardEditScreen extends StatefulWidget {
  @override
  State createState() => _BusinessCardEditScreenState();
}

class _BusinessCardEditScreenState extends State<BusinessCardEditScreen> {
  @override
  Widget build(BuildContext context) {
    Participant p = Database().participants[AppState().userid];
    return Scaffold (
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: CardyBAppBar(pageTitle: 'Edit Business Card'),
      body: new ListView.builder(
        itemCount: p.cardAttributes.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
              padding: EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  new CheckboxListTile(
                    value: false,
                    title: new Text('Field $index'),
                    controlAffinity: ListTileControlAffinity.leading,
                    /*Apply function here*/
                  )
                ],
              ),
            )
          );
        },
      )
    );
  }
}
