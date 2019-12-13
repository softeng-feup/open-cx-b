import 'package:cardy_b/logic/business_card.dart';
import 'package:flutter/material.dart';

class BusinessCardWidget extends StatelessWidget {
  final BusinessCard card;

  BusinessCardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      color: Color.fromARGB(255, card.red, card.green, card.blue),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(0.05 * MediaQuery.of(context).size.width),
      child: Container(
          width: 0.9 * MediaQuery.of(context).size.width,
          height: 0.3 * MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(
                    0.02 * MediaQuery.of(context).size.height,
                  ),
                  height: 0.15 * MediaQuery.of(context).size.height,
                  width: 0.15 * MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset(card.photo),
                  ),
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text(
                        card.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.03 * MediaQuery.of(context).size.width,
                        ),
                        child: Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              top: 0.01 * MediaQuery.of(context).size.width),
                          child: Text(
                            card.email,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.01 * MediaQuery.of(context).size.width,
                        ),
                        child: Text(
                          "Twitter",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          child: Text(
                        card.twitter,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Container(
                        child: Text(
                          "LinkedIn",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          child: Text(
                        card.linkedIn,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Container(
                        child: Text(
                          "Website",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          child: Text(
                        card.website,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ])),
              ])),
    );
  }
}
