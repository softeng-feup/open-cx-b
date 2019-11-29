import 'package:cardy_b/businesscard.dart';
import 'package:cardy_b/colors.dart';
import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/pages/own_profile_display.dart';
import 'package:cardy_b/qr_reader.dart';
import 'package:cardy_b/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> businessCards = _getBusinessCard(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: CardyBAppBar(),
      body: Column(
        children: <Widget>[
          ProfileCard(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: businessCards.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(child: businessCards[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: CardyBColors.Accent,
          children: [
            SpeedDialChild(
                child: Icon(Icons.library_add),
                backgroundColor: CardyBColors.LightAccent,
                label: "Get a card",
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QrReader()),
                    )),
            SpeedDialChild(
                child: Icon(Icons.send),
                backgroundColor: CardyBColors.LightAccent,
                label: "Send a card by QR Code",
                onTap: () => shareCard(context)),
            SpeedDialChild(
                child: Icon(Icons.send),
                backgroundColor: CardyBColors.LightAccent,
                label: "Send a card by NFC",
                onTap: () => shareCard(context))
          ]),
    );
  }

  /*A testar o porquê de isto não funcionar assim*/
  /*void test(BuildContext context) {
    SpeedDial (
        backgroundColor: Colors.blue,
        children: [
          SpeedDialChild (
            child: Icon(Icons.code),
            backgroundColor: Colors.red,
            label: "QR Code",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QrReader()),
          )
        )
      ],
    );
  }*/

  List<Widget> _getBusinessCard(BuildContext context) {
    var user = Database().getParticipantById(AppState().userid);
    var cards = user.connections.map( (connection) => BusinessCard.fromParticipant(Database().getParticipantById(connection)));


    List<Widget> cardList = new List();

    for (var card in cards) {
      Widget info = new Container(
          padding: EdgeInsets.all(10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  children: <Widget>[
                    Text(
                      card.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      card.email,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                    ),
                    Text(
                      card.linkedIn,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                    ),
                  ],
                ))
              ]));
      cardList.add(
        Card(
          elevation: 12,
          color:
              Color.fromARGB(255, card.red, card.green, card.blue),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            width: 0.55 * MediaQuery.of(context).size.height,
            height: 0.3 * MediaQuery.of(context).size.height,
            child: info,
          ),
        ),
      );
    }
    return cardList;
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var p = Database().getParticipantById(AppState().userid);
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0.02 * MediaQuery.of(context).size.width),
        child: Container(
          padding: EdgeInsets.all(
            0.02 * MediaQuery.of(context).size.height,
          ),
          height: 0.2 * MediaQuery.of(context).size.height,
          width: 0.55 * MediaQuery.of(context).size.height,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(
                    0.0 * MediaQuery.of(context).size.height,
                  ),
                  height: 0.15 * MediaQuery.of(context).size.height,
                  width: 0.15 * MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset(p.photo),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text(p.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 28)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OwnProfileDisplayPage()),
                                );
                              },
                              child: Text('View Profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text('Display Card',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            )
                          ]),
                    )
                  ],
                ))
              ]),
          decoration: BoxDecoration(
            color: CardyBColors.Accent,
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 2.0),
            ],
          ),
        ));
  }
}

Widget shareCard(BuildContext context1) => PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("Qr-code"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("NFC"),
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Manual"),
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Filler :("),
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Other :)"),
        ),
      ],
      initialValue: 2,
      onCanceled: () {
        print("You have canceled the menu.");
      },
      onSelected: (value) {
        switch (value) {
          case 1:
            Navigator.push(
              context1,
              MaterialPageRoute(builder: (context1) => QrReader()),
            );
            break;
          default:
            print("not implemented yet :/");
        }
      },
      padding: EdgeInsets.all(20),
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CardyBColors.Accent,
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 15.0),
                  blurRadius: 15.0)
            ]),
        child: Icon(
          Icons.library_add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
