import 'package:cardy_b/logic/model.dart';

class BusinessCard {
  int red = 120;
  int green = 30;
  int blue = 50;
  String name = 'Placeholder Name';
  String email = 'Placeholder Email';
  String linkedIn = 'Placeholder linkedIn';
  String photo = 'photo.png';
  String website = 'Placeholder Name';
  String company = 'Placeholder Email';
  String bio = 'Placeholder linkedIn';
  String twitter = 'chico';

  int id = -1;

  BusinessCard(this.red, this.green, this.blue, this.name, this.email,
      this.linkedIn, this.photo);

  BusinessCard.fromParticipant(Participant participant) {
    this.red = participant.red;
    this.green = participant.green;
    this.blue = participant.blue;
    this.name = participant.name ?? 'John Doe';
    this.email = participant.email ?? 'john.doe@example.com';
    this.linkedIn = participant.linkedIn ?? 'john.doe';
    this.photo = participant.photo ?? 'eduardo.jpg';
    this.website = participant.website ?? 'siteTop.com';
    this.company = participant.company ?? 'Influencers C.A.';
    this.bio = participant.bio ?? 'Eduardo is the King he is very handsome he programs a lot, xD.';
    this.twitter = participant.twitter ?? 'edudududu';
  }
}
