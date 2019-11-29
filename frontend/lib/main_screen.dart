import 'package:cardy_b/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'businesscard.dart';
import 'profile_screen.dart';
import 'qr_reader.dart';

class MainScreen extends StatelessWidget {

  final Participant participant;

  MainScreen(this.participant);

  @override
  Widget build(BuildContext context) {
    List<Widget> businessCards = _getBusinessCard(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 180, 0, 0),
          title: Image.asset('images/white_logo.png'),
          centerTitle: true),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 0.01 * MediaQuery.of(context).size.height,
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(
                  0.025 * MediaQuery.of(context).size.height,
                ),
                height: 0.2 * MediaQuery.of(context).size.height,
                width: 0.55 * MediaQuery.of(context).size.height,
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
                          child: Image.asset(participant.photo),
                        ),
                      ),
                      Container(
                        child: Text(participant.name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: RaisedButton(
                          color: Color.fromARGB(255, 180, 20, 20),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile(participant)),
                            );
                          },
                          child:
                              Text('Profile', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ]),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 180, 20, 20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0),
                  ],
                ),
              )),
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
      floatingActionButton: SpeedDial (
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.redAccent,
        children: [
          SpeedDialChild(
            child: Icon(Icons.library_add),
              backgroundColor: Colors.red,
              label: "Get a card",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QrReader()))
          ),
          SpeedDialChild(
              child: Icon(Icons.send),
              backgroundColor: Colors.red,
              label: "Send a card by QR Code",
              onTap: () => shareCard(context)
          ),
          SpeedDialChild(
              child: Icon(Icons.send),
              backgroundColor: Colors.red,
              label: "Send a card by NFC",
              onTap: () => shareCard(context)
          )
        ]
      ),
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
    List<BusinessCard> cards = new List();
    double numberOfCards = 0;
    cards.add(BusinessCard(218, 44, 56, participant.name, participant.email,
        participant.company, participant.photo ));
    numberOfCards++;

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
        Draggable(
          onDragEnd: (drag) {
            //what to do when not dragging anymore.
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: Color.fromARGB(
                255, cards[i].red, cards[i].green, cards[i].blue),
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
            color: Color.fromARGB(
                255, cards[i].red, cards[i].green, cards[i].blue),
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


