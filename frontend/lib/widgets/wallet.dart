import 'package:cardy_b/logic/business_card.dart';
import 'package:cardy_b/widgets/business_card.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  List<BusinessCard> cards;

  Wallet(this.cards);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int i) =>
          BusinessCardWidget(cards[i]),
    );
  }
}
