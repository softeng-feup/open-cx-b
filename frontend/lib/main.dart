import 'package:flutter/material.dart';
import 'dart:async';
import 'businesscard.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart'

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 1, milliseconds: 500),
            () =>
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.2 * MediaQuery.of(context).size.height,
                    left: 0.1 * MediaQuery.of(context).size.width,
                    right: 0.1 * MediaQuery.of(context).size.width),
                child: Image.asset('images/feup.jpg'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.1 * MediaQuery.of(context).size.height,
                    left: 0.2 * MediaQuery.of(context).size.width,
                    right: 0.2 * MediaQuery.of(context).size.width),
                child: Image.asset('images/logo.png'),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.05 * MediaQuery.of(context).size.height,
                    left: 0.01 * MediaQuery.of(context).size.width,
                    right: 0.5 * MediaQuery.of(context).size.width),
                child: Image.asset('images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.1 * MediaQuery.of(context).size.height,
                  left: 0.1 * MediaQuery.of(context).size.width,
                  right: 0.1 * MediaQuery.of(context).size.width,
                ),
                child: Container(

                  width: double.infinity,
                  height: 0.4 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 15.0
                        )
                      ]

                  ),
                ),
              ),
              Spacer(),
              ButtonBar(
                children: <Widget>[
                  const RaisedButton(
                    onPressed: null,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20)
                    ),
                  ),
                  const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: const Text(
                      'Skip Login',
                      style: TextStyle(fontSize: 20)
                    ),
                  ),
                ]
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          SizedBox(
              height: 0.5 * MediaQuery.of(context).size.height
            ),
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> businessCards = _getBusinessCard(context) ;
    return Scaffold(backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 180, 0, 0),
        title: Image.asset('images/white_logo.png'),
        centerTitle: true
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 0.01 * MediaQuery.of(context).size.height,),
          ),
          Container(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(0.025 * MediaQuery.of(context).size.height,),
                height: 0.2 * MediaQuery.of(context).size.height,
                width: 0.55 * MediaQuery.of(context).size.height,
                child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0.02 * MediaQuery.of(context).size.height,),
                        height: 0.15 * MediaQuery.of(context).size.height,
                        width: 0.15 * MediaQuery.of(context).size.height,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(100.0),
                          child: Image.asset('images/photo.png'),
                        ),
                      ),
                      Container(
                        child: Text(
                            'Chico da Tina ',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        child: Text(
                            'Profile',
                            style: TextStyle(fontSize: 20)
                        ),
                      ),
                    ]
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 180, 20, 20),
                  boxShadow:[
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: businessCards.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(child: businessCards[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ],
      ),
      floatingActionButton: cardOptions(),
    );
  }
  

  List<Widget> _getBusinessCard(BuildContext context){
    List<BusinessCard> cards =  new List();
    double numberOfCards = 8;
    cards.add(BusinessCard(218, 44, 56, "chico Tina", "chico@mail.com", "chico_official", "photo.png"));
    cards.add(BusinessCard(34, 111, 84, "1chico Tina", "chico@mail.com", "chico_official", "photo.png"));
    cards.add(BusinessCard(135, 195, 143, "2chico Tina", "chico@mail.com", "chico_official", "photo.png"));
    cards.add(BusinessCard(95, 180, 156, "3chico Tina", "chico@mail.com", "chico_official", "photo.png"));
    cards.add(BusinessCard(5, 255, 60, "4chico Tina", "chico@mail.com", "chico_official","photo.png"));
    cards.add(BusinessCard(34, 111, 84, "5chico Tina", "chico@mail.com", "chico_official", "photo.png"));
    cards.add(BusinessCard(135, 195, 143, "6chico Tina", "chico@mail.com", "chico_official", "photo.png"));
    cards.add(BusinessCard(95, 180, 156, "7chico Tina", "chico@mail.com", "chico_official", "photo.png"));
    List<Widget> cardList = new List();

    for (int i = 0; i < numberOfCards; i++) {
      Widget info = new Container(
          padding: EdgeInsets.all(10),
          child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0.02 * MediaQuery.of(context).size.height,),
                  height: 0.15 * MediaQuery.of(context).size.height,
                  width: 0.15 * MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset('images/' + cards[i].photo),
                  ),
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          cards[i].name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          cards[i].email,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          cards[i].linkedIn,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                )
              ]
          )
      );
      cardList.add(Draggable(
          onDragEnd: (drag){
            //what to do when not dragging anymore.
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[i].redValue, cards[i].greenValue, cards[i].blueValue),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 0.55 * MediaQuery.of(context).size.height,
              height: 0.3 * MediaQuery.of(context).size.height,
              child: info,
            ),
          ),
          child: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[i].redValue, cards[i].greenValue, cards[i].blueValue),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 0.55 * MediaQuery.of(context).size.height,
              height: 0.3 * MediaQuery.of(context).size.height,
              child: info,
            ),
          ),
        ),
      );
    }
    return cardList;
  }
}

Widget cardOptions() => PopupMenuButton(

  itemBuilder: (context) {
    var list = List<PopupMenuEntry<Object>>();
    list.add(
      PopupMenuItem(
        child: Text("Add Card through:"),
        value: 1,
      ),
    );
    list.add(
      PopupMenuDivider(
        height: 10,
      ),
    );
    list.add(
      CheckedPopupMenuItem(
        child: Text(
          "NFC",
          style: TextStyle(color: Color.fromARGB(255, 180, 20, 20)),
        ),
        value: 2,
        checked: true,
      ),
    );
    list.add(
      CheckedPopupMenuItem(
        child: Text(
          "QR Code",
          style: TextStyle(color: Color.fromARGB(255, 180, 20, 20)),
        ),
        value: 2,
        checked: true,
      ),
    );

    list.add(
      CheckedPopupMenuItem(
        child: Text(
          "Other",
          style: TextStyle(color: Color.fromARGB(255, 180, 20, 20)),
        ),
        value: 2,
        checked: true,
      ),
    );

    return list;
  },
  padding: EdgeInsets.all(20),
  child: Container(
      width: 60.0,
      height: 60.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromARGB(255, 180, 20, 20),
      boxShadow: [
        BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 15.0),
            blurRadius: 15.0
        )
      ]
    ),
    child: Icon(
      Icons.library_add,
      size: 40,
      color: Colors.white,
    ),
  ),

);


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 180, 0, 0),
          title: Image.asset('images/white_logo.png'),
          centerTitle: true
      ),
      body: Stack(
          children: <Widget>[
           SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 0.1 * MediaQuery.of(context).size.height,
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
                      style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.03 * MediaQuery.of(context).size.width,
                    right: 0.7 * MediaQuery.of(context).size.width,),
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                        left: 0.1 * MediaQuery.of(context).size.width,
                        right: 0.1 * MediaQuery.of(context).size.width),
                  child: TextField(
                    controller: TextEditingController()..text = 'Chicod@tina.com',
                    onChanged: (text) {
                      print("Ok: $text");
                    },
                  )
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.01 * MediaQuery.of(context).size.width,
                    right: 0.6 * MediaQuery.of(context).size.width,),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.red, fontSize: 12,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.03 * MediaQuery.of(context).size.width,
                    right: 0.65 * MediaQuery.of(context).size.width,),
                  child: Text(
                    'Website',
                    style: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 0.1 * MediaQuery.of(context).size.width,
                        right: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
                      controller: TextEditingController()..text = 'chicotina.com',
                      onChanged: (text) {
                        print("Ok: $text");
                      },
                    )
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.03 * MediaQuery.of(context).size.width,
                    right: 0.65 * MediaQuery.of(context).size.width,),
                  child: Text(
                    'LinkedIn',
                    style: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 0.1 * MediaQuery.of(context).size.width,
                        right: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
                      controller: TextEditingController()..text = 'linkedin.com/tina',
                      onChanged: (text) {
                        print("Ok: $text");
                      },
                    )
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
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                       child: Text(
                          'Add Field',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                ),
              ],
            )
           ),
          ],
      )
    );
  }
}