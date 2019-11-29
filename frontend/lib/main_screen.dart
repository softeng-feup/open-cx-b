import 'package:cardy_b/app_bar.dart';
import 'package:cardy_b/app_state.dart';
import 'package:cardy_b/database.dart';
import 'package:flutter/material.dart';
import 'businesscard.dart';
import 'profile_display_screen.dart';
import 'qr_reader.dart';

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
      floatingActionButton: cardOptions(context),
    );
  }

  List<Widget> _getBusinessCard(BuildContext context) {
    List<BusinessCard> cards = new List();
    double numberOfCards = 0;
    cards.add(BusinessCard(218, 44, 56, "chico Tina", "chico@mail.com",
        "chico_official", "photo.png"));
    numberOfCards++;
    /*cards.add(BusinessCard(34, 111, 84, "1chico Tina", "chico@mail.com",
        "chico_official", "obama.png"));
    cards.add(BusinessCard(135, 195, 143, "2chico Tina", "chico@mail.com",
        "chico_official", "photo.png"));
    cards.add(BusinessCard(95, 180, 156, "3chico Tina", "chico@mail.com",
        "chico_official", "obama.png"));
    cards.add(BusinessCard(5, 255, 60, "4chico Tina", "chico@mail.com",
        "chico_official", "photo.png"));
    cards.add(BusinessCard(34, 111, 84, "5chico Tina", "chico@mail.com",
        "chico_official", "obama.png"));
    cards.add(BusinessCard(135, 195, 143, "6chico Tina", "chico@mail.com",
        "chico_official", "photo.png"));
    cards.add(BusinessCard(95, 180, 156, "7chico Tina", "chico@mail.com",
        "chico_official", "obama.png"));*/
    List<Widget> cardList = new List();

    for (int i = 0; i < numberOfCards; i++) {
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
                ))
              ]));
      cardList.add(
        Card(
          elevation: 12,
          color:
              Color.fromARGB(255, cards[i].red, cards[i].green, cards[i].blue),
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
                                      builder: (context) => ProfileDisplayScreen()),
                                );
                              },
                              child: Text('View Profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                            FlatButton(
                              onPressed: () { },
                              child: Text('Display Card',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            )
                          ]
                      ),
                    )
                  ],
                ))
              ]),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 180, 20, 20),
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

Widget cardOptions(BuildContext context1) => PopupMenuButton(
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
            color: Color.fromARGB(255, 180, 20, 20),
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
