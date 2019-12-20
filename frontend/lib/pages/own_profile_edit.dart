import 'package:cardy_b/colors.dart';
import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:cardy_b/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ProfileEditScreenState();
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

    final TextEditingController _nameChanger = new TextEditingController();
    final TextEditingController _emailChanger = new TextEditingController();

    List<Widget> otherWidgets = List();
    otherFields.forEach((title, content) {
      TextEditingController controller = ProfileEditorController().controllerSelect(title);
      otherWidgets.add(new Container(
        padding: EdgeInsets.symmetric(
            vertical: 0.01 * MediaQuery
                .of(context)
                .size
                .height,
            horizontal: 0.1 * MediaQuery
                .of(context)
                .size
                .width),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            child: TextField(
              decoration: new InputDecoration(labelText: title),
              controller: controller,
              onChanged: (text) {
                ProfileEditorController().updateOptionalField(title, controller.text);
              },
            ),
          ),
          FlatButton(onPressed: () {}, child: Icon(Icons.remove))
        ]),
      ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: CardyBAppBar(pageTitle: 'Edit Profile'),
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
                          controller: _nameChanger,
                          onChanged: (text) {
                            ProfileEditorController().updateUserName(_nameChanger.text);
                          },
                          decoration: new InputDecoration(labelText: 'Name'))),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.1 * MediaQuery.of(context).size.width),
                        child: TextField(
                            controller: _emailChanger,
                            onChanged: (text) {
                              ProfileEditorController().updateUserEmail(_emailChanger.text);
                            },
                            decoration: new InputDecoration(labelText: 'Email'))),
                    ...otherWidgets,
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.1 * MediaQuery
                                .of(context)
                                .size
                                .width),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('Add Field'),
                        )
                    )
                  ]
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context,
            MaterialPageRoute(builder: (context1) => ProfileEditScreen()));},
        tooltip: 'Save Changes',
        child: Icon(Icons.check),
        backgroundColor: CardyBColors.Accent,
      ),
    );
  }
}

class ProfileEditorController {
  Participant _p;

  final TextEditingController _bioChanger = new TextEditingController();
  final TextEditingController _companyChanger = new TextEditingController();
  final TextEditingController _positionChanger = new TextEditingController();
  final TextEditingController _websiteChanger = new TextEditingController();
  final TextEditingController _linkedInChanger = new TextEditingController();
  final TextEditingController _gitHubChanger = new TextEditingController();
  final TextEditingController _twitterChanger = new TextEditingController();

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

  TextEditingController controllerSelect(String key) {
    switch (key) {
      case 'Bio':
        return _bioChanger;
      case 'Company':
        return _companyChanger;
      case 'Position':
        return _positionChanger;
      case 'Website':
        return _websiteChanger;
      case 'LinkedIn':
        return _linkedInChanger;
      case 'GitHub':
        return _gitHubChanger;
      case 'Twitter':
        return _twitterChanger;
    }
    return null;
  }
}
