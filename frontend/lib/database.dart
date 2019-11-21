import 'model.dart';
import 'dart:core';

class Database {
  static final Database _instance = Database._internal();

  factory Database() {
    return _instance;
  }

  Database._internal() {
    this._seed();
  }

  int _nextParticipantId = 0;
  int _nextSponsorId = 0;
  int _nextLectureId = 0;

  Map<int, Participant> participants = Map();
  Map<int, Sponsor> sponsors = Map();
  Map<int, Lecture> lectures = Map();

  void _seed() {
    addParticipant(
      name: 'eduardo',
      email: 'eduardo@gmail.com',
      photo: 'images/eduardo.jpg',
      password: 'souRei',
    );
  }

  void addParticipant(
      {String name,
      String bio,
      String email,
      String password,
      String company,
      String position,
      String website,
      String linkedIn,
      String gitHub,
      String twitter,
      String photo,
      String cv,
      List<int> lectures,
      List<String> cardAttributes,
      List<int> connections}) {
    int id = _nextParticipantId++;
    var participant = Participant(
        id: id,
        name: name,
        bio: bio,
        password: password,
        email: email,
        company: company,
        position: position,
        website: website,
        linkedIn: linkedIn,
        twitter: twitter,
        photo: photo,
        cv: cv,
        lectures: lectures,
        cardAttributes: cardAttributes,
        connections: connections);
    participants[id] = participant;
  }
}
