import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;


class QrReader extends StatelessWidget{
  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 180, 0, 0),
            title: Image.asset('images/white_logo.png'),
            centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.memory(bytes),
              ),
              Text('RESULT  $barcode'),
              RaisedButton(onPressed: _scan, child: Text("Scan")),
              RaisedButton(onPressed: _scanPhoto, child: Text("Scan Photo")),
              RaisedButton(onPressed: _generateBarCode, child: Text("Generate Barcode")),
            ],
          ),
        ),
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this.barcode = barcode;
    //Do stuff
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    this.barcode = barcode;
    // Do stuff
  }

  Future _generateBarCode() async {
    Uint8List result = await scanner.generateBarCode('https://github.com/leyan95/qrcode_scanner');
    this.bytes = result;

  }
}