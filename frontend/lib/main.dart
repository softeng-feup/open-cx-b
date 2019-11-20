import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'main_screen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;

  @override
  void initState() {
    super.initState();

    new Future.delayed(
        const Duration(seconds: 1, milliseconds: 500),
        () => Navigator.push(
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
                padding: EdgeInsets.only(
                    top: 0.2 * MediaQuery.of(context).size.height,
                    left: 0.1 * MediaQuery.of(context).size.width,
                    right: 0.1 * MediaQuery.of(context).size.width),
                child: Image.asset('images/feup.jpg'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 0.1 * MediaQuery.of(context).size.height,
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
                padding: EdgeInsets.only(
                    top: 0.05 * MediaQuery.of(context).size.height,
                    left: 0.01 * MediaQuery.of(context).size.width,
                    right: 0.5 * MediaQuery.of(context).size.width),
                child: Image.asset('images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.1 * MediaQuery.of(context).size.height,
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
                            blurRadius: 15.0)
                      ]),
                ),
              ),
              Spacer(),
              ButtonBar(children: <Widget>[
                const RaisedButton(
                  onPressed: null,
                  child: Text('Login', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child:
                      const Text('Skip Login', style: TextStyle(fontSize: 20)),
                ),
              ]),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          SizedBox(height: 0.5 * MediaQuery.of(context).size.height),
        ],
      ),
    );
  }
}
