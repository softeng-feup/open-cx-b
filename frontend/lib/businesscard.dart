import 'model.dart';


class BusinessCard {
  int red = 0;
  int green = 0;
  int blue = 0;
  String name = 'Placeholder Name';
  String email = 'Placeholder Email';
  String linkedIn = 'Placeholder linkedIn';
  String photo = 'photo.png';

  int id = -1;

  BusinessCard(this.red, this.green, this.blue, this.name, this.email,
      this.linkedIn, this.photo);

  BusinessCard.fromParticipant(Participant participant) {
    this.name = participant.name ?? 'John Doe';
    this.email = participant.email ?? 'john.doe@example.com';
    this.linkedIn = participant.linkedIn ?? 'john.doe';
    this.photo = participant.photo ?? 'eduardo.jpg';
  }
}
