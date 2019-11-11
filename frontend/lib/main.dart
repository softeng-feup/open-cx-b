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
  final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100];
  Widget build(BuildContext context) {
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
          Container(
            height: 1 * MediaQuery.of(context).size.width,
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(bottom: 0.02 * MediaQuery.of(context).size.height,
                right: 0.1 * MediaQuery.of(context).size.width),

            child:Container(
              child: cardOptions(),
            ),
          ),
        ],
      )

      /*Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.01 * MediaQuery.of(context).size.height,),
                child:
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
                      )
                    ],
                  ),
                )
              ),
              Container(
                height: 0.7 * MediaQuery.of(context).size.width,
                child: ListView(
                     children: _getBusinessCard(context),
                  ),
                ),
              Expanded(
                child: Container(),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(bottom: 0.02 * MediaQuery.of(context).size.height,
                    right: 0.1 * MediaQuery.of(context).size.width),

                child:Container(
                  child: cardOptions(),
                ),
              ),
            ],
          ),
        ],
      ),*/
    );
  }

  List<Widget> _getBusinessCard(BuildContext context){
    List<BusinessCard> cards =  new List();
    double numberOfCards = 3;
    cards.add(BusinessCard(218, 44, 56, 10));
    cards.add(BusinessCard(34, 111, 84, 20));
    cards.add(BusinessCard(135, 195, 143, 30));
    cards.add(BusinessCard(95, 180, 156, 40));
    cards.add(BusinessCard(5, 255, 60, 50));
    cards.add(BusinessCard(34, 111, 84, 60));
    cards.add(BusinessCard(135, 195, 143, 70));
    cards.add(BusinessCard(95, 180, 156, 80));
    List<Widget> cardList = new List();

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
                child: Image.asset('images/photo.png'),
             ),
            ),
            Container(
              child: Text(
                'Chico da Tina ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ]
        )
    );

    for (int i = 0; i < numberOfCards; i++) {
      cardList.add(Positioned(
        top: 0.2 * MediaQuery.of(context).size.height * i,
        child: Draggable(
          onDragEnd: (drag){
            cardList.removeAt(i);
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
      ));
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
          style: TextStyle(color: Colors.blueAccent),
        ),
        value: 2,
        checked: true,
      ),
    );

    list.add(
      CheckedPopupMenuItem(
        child: Text(
          "Other",
          style: TextStyle(color: Colors.blueAccent),
        ),
        value: 2,
        checked: true,
      ),
    );

    return list;
  },
  icon: Icon(
    Icons.add,
    size: 50,
    color: Colors.red,
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
                    'Website',
                    style: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 0.1 * MediaQuery.of(context).size.width,
                        right: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
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
                      onChanged: (text) {
                        print("Ok: $text");
                      },
                    )
                )
              ],
            )
           ),
          ],
      )
    );
  }
}