import 'package:cardy_b/model.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'app_state.dart';
import 'app_bar.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  State createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    Participant p = Database().participants[AppState().userid];
    var photo = p.photo;
    //var email = p.email;
    //var name = p.name;
    var otherFields = Map<String, String>();
    if (p.bio != null) otherFields['Bio'] = p.bio;
    if (p.company != null) otherFields['Company'] = p.company;
    if (p.position != null) otherFields['Position'] = p.position;
    if (p.website != null) otherFields['Website'] = p.website;
    if (p.linkedIn != null) otherFields['LinkedIn'] = p.linkedIn;
    if (p.gitHub != null) otherFields['GitHub'] = p.gitHub;
    if (p.twitter != null) otherFields['Twitter'] = p.twitter;
    List<Widget> otherWidgets = List();
    otherFields.forEach((title, content) {
      otherWidgets.add(Container(
        padding: EdgeInsets.symmetric(
            vertical: 0.01 * MediaQuery.of(context).size.height,
            horizontal: 0.1 * MediaQuery.of(context).size.width),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            child: TextField(decoration: new InputDecoration(labelText: title)),
          ),
          FlatButton(onPressed: () {}, child: Icon(Icons.remove))
        ]),
      ));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: CardyBAppBar(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: 0.1 * MediaQuery.of(context).size.height,
                      left: 0.3 * MediaQuery.of(context).size.width,
                      right: 0.3 * MediaQuery.of(context).size.width),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(1000.0),
                    child: Image.asset(photo),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(0.02 * MediaQuery.of(context).size.height),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
                        decoration: new InputDecoration(labelText: 'Name'))),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
                        decoration: new InputDecoration(labelText: 'Email'))),
                ...otherWidgets,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.1 * MediaQuery.of(context).size.width),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('Add Field'),
                      )
                    )
              ])),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Save Changes',
        child: Icon(Icons.check),
        backgroundColor: Color.fromARGB(255, 180, 20, 20),
      ),
    );
  }
}

class ProfileEditorController {
  Participant _p;
  ProfileEditorController() {
    var userid = AppState().userid;
    _p = Database().getParticipantById(userid);
  }
  void updateUserEmail(String email) {
    _p.email = email;
  }
  void updateUserName(String name) {
    _p.name = name;
  }
  void updateOptionalField(String key, String value) {
    switch (key) {
      case 'Bio':
        _p.bio = value;
        break;
      case 'Company':
        _p.company = value;
        break;
      case 'Position':
        _p.position = value;
        break;
      case 'Website':
        _p.website = value;
        break;
      case 'LinkedIn':
        _p.linkedIn = value;
        break;
      case 'GitHub':
        _p.gitHub = value;
        break;
      case 'Twitter':
        _p.twitter = value;
        break;
    }
  }
  void removeOptionalField(String key) {
    switch (key) {
      case 'Bio':
        _p.bio = null;
        break;
      case 'Company':
        _p.company = null;
        break;
      case 'Position':
        _p.position = null;
        break;
      case 'Website':
        _p.website = null;
        break;
      case 'LinkedIn':
        _p.linkedIn = null;
        break;
      case 'GitHub':
        _p.gitHub = null;
        break;
      case 'Twitter':
        _p.twitter = null;
        break;
    }
  }
}

