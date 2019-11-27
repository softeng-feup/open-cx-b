import 'package:cardy_b/model.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'app_state.dart';

class Profile extends StatefulWidget {

  _ProfileScreenState createState() {
    _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<Profile> {
  final int id = AppState().userid;
  String photo;
  String email;
  String name;
  Map<String, String> otherFields;
  void Function(String, Map<String,String>) profileUpdateCallback;
  _ProfileScreenState() {
    Participant p = Database().participants[id];
    photo = p.photo;
    email = p.email;
    name = p.name;
    otherFields = {};
    if (p.bio != null) otherFields['Bio'] = p.bio;
    if (p.company != null) otherFields['Company'] = p.company;
    if (p.position != null) otherFields['Position'] = p.position;
    if (p.website != null) otherFields['Website'] = p.website;
    if (p.linkedIn != null) otherFields['LinkedIn'] = p.linkedIn;
    if (p.gitHub != null) otherFields['GitHub'] = p.gitHub;
    if (p.twitter != null) otherFields['Twitter'] = p.twitter;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 180, 0, 0),
            title: Image.asset('images/white_logo.png'),
            centerTitle: true),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.1 * MediaQuery.of(context).size.height,
                          left: 0.3 * MediaQuery.of(context).size.width,
                          right: 0.3 * MediaQuery.of(context).size.width),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(1000.0),
                        child: Image.asset(this.photo),
                      ),
                    ),
                    Container(
                      child: Text(
                        this.name,
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 0.03 * MediaQuery.of(context).size.width,
                        right: 0.7 * MediaQuery.of(context).size.width,
                      ),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 0.1 * MediaQuery.of(context).size.width,
                            right: 0.1 * MediaQuery.of(context).size.width),
                        child: TextField(
                          controller: TextEditingController()
                            ..text = this.email,
                          onChanged: (text) {
                            print("Ok: $text");
                          },
                        )),
                    Container(
                      padding: EdgeInsets.only(
                        top: 0.01 * MediaQuery.of(context).size.width,
                        right: 0.6 * MediaQuery.of(context).size.width,
                      ),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 0.03 * MediaQuery.of(context).size.width,
                        right: 0.65 * MediaQuery.of(context).size.width,
                      ),
                      child: Text(
                        'Website',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 0.1 * MediaQuery.of(context).size.width,
                            right: 0.1 * MediaQuery.of(context).size.width),
                        child: TextField(
                          controller: TextEditingController()
                            ..text = 'chicotina.com',
                          onChanged: (text) {
                            print("Ok: $text");
                          },
                        )),
                    Container(
                      padding: EdgeInsets.only(
                        top: 0.03 * MediaQuery.of(context).size.width,
                        right: 0.65 * MediaQuery.of(context).size.width,
                      ),
                      child: Text(
                        'LinkedIn',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 0.1 * MediaQuery.of(context).size.width,
                            right: 0.1 * MediaQuery.of(context).size.width),
                        child: TextField(
                          controller: TextEditingController()
                            ..text = 'linkedin.com/tina',
                          onChanged: (text) {
                            print("Ok: $text");
                          },
                        )),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.04 * MediaQuery.of(context).size.width,
                          right: 0.52 * MediaQuery.of(context).size.width),
                      child: RaisedButton(
                        color: Color.fromARGB(255, 180, 0, 0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                        child: Text(
                          'Add Field',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldList = _getProfileFields(context);
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 180, 0, 0),
            title: Image.asset('images/white_logo.png'),
            centerTitle: true),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 0.1 * MediaQuery.of(context).size.height,
                      left: 0.3 * MediaQuery.of(context).size.width,
                      right: 0.3 * MediaQuery.of(context).size.width),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(1000.0),
                    child: Image.asset('images/photo.png'),
                  ),
                ),
                Container(
                  child: Text(
                    'Chico da Tina',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: fieldList,
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.52 * MediaQuery.of(context).size.width),
                  child: RaisedButton(
                    color: Color.fromARGB(255, 180, 0, 0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Text(
                      'Add Field',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ));
  }
}

List<Widget> _getProfileFields(BuildContext context){
  var fieldInfo = [['Email','Email'],['GitHub','GitHub'],['LinkedIn','LinkedIn'],['Email','Email'],['GitHub','GitHub'],['LinkedIn','LinkedIn']];

  List<Widget> fieldList = new List();

  for(var i=0; i<fieldInfo.length; i++){
    fieldList.add(
      Container(
        padding: EdgeInsets.only(
          top: 0.03 * MediaQuery.of(context).size.width,
          right: 0.65 * MediaQuery.of(context).size.width,
        ),
        child: Text(
          fieldInfo[i][0],
          style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
    fieldList.add(
      Container(
        padding: EdgeInsets.only(
            left: 0.1 * MediaQuery.of(context).size.width,
            right: 0.1 * MediaQuery.of(context).size.width),
        child: TextField(
          controller: TextEditingController()
            ..text = fieldInfo[i][1],
          onChanged: (text) {
            print("Ok: $text");
          },
        )
      ),
    );
  }
  return fieldList;
}

