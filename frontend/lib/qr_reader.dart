import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/material.dart';

class QrReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String cameraScanResult = scanner.scan().toString();
  }
}
