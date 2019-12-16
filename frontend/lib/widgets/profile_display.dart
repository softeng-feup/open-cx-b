import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:flutter/material.dart';

class ProfileDisplay extends StatelessWidget {
  final int _userId;

  ProfileDisplay(this._userId);

  @override
  Widget build(BuildContext context) {
    var p = _getParticipant();
    var photo = p.photo;
    var email = p.email;
    var name = p.name;
    var otherFields = Map<String, String>();
    if (p.bio != null) otherFields['Bio'] = p.bio;
    if (p.company != null) otherFields['Company'] = p.company;
    if (p.position != null) otherFields['Position'] = p.position;
    if (p.website != null) otherFields['Website'] = p.website;
    if (p.linkedIn != null) otherFields['LinkedIn'] = p.linkedIn;
    if (p.gitHub != null) otherFields['GitHub'] = p.gitHub;
    if (p.twitter != null) otherFields['Twitter'] = p.twitter;
    var otherWidgets = OptionalFieldsDisplay(otherFields);
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.only(
                top: 0.1 * MediaQuery
                    .of(context)
                    .size
                    .height,
                left: 0.3 * MediaQuery
                    .of(context)
                    .size
                    .width,
                right: 0.3 * MediaQuery
                    .of(context)
                    .size
                    .width),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(1000.0),
              child: Image.asset(photo),
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(0.02 * MediaQuery
                .of(context)
                .size
                .height),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.1 * MediaQuery
                      .of(context)
                      .size
                      .width),
              child:
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Container(
                    /*padding: EdgeInsets.only(
                                      top: 0.03 * MediaQuery.of(context).size.width,
                                      right: 0.65 * MediaQuery.of(context).size.width,
                                    ),*/
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * MediaQuery
                              .of(context)
                              .size
                              .width),
                      child: Text(
                        email,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ))
                ])),
          otherWidgets
    ]));
  }

  Participant _getParticipant() {
    var db = Database();
    return db.getParticipantById(_userId);
  }
}

class OptionalFieldsDisplay extends StatelessWidget {
  final Map<String, String> _fields;

  OptionalFieldsDisplay(this._fields);

  @override
  Widget build(BuildContext context) {
    List<Widget> fields = List();
    _fields.forEach((title, content) {
      fields.add(Container(
          padding: EdgeInsets.symmetric(
              vertical: 0.01 * MediaQuery.of(context).size.height,
              horizontal: 0.1 * MediaQuery.of(context).size.width),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Container(
                  //padding: EdgeInsets.all(0.03 * MediaQuery.of(context).size.width,
                  //),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.01 * MediaQuery
                          .of(context)
                          .size
                          .width),
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                )
              ])));
    });
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: fields);
  }
}
