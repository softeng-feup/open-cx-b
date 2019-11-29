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

  Map<int, Participant> participants = Map();

  Participant getParticipantById(id) => participants[id];
  void updateParticipantById(int id, Participant p) { participants[id] = p; }

  void _seed() {
    addParticipant(
      name: 'Eduardo',
      email: 'eduardo@gmail.com',
      photo: 'images/eduardo.jpg',
      website: 'siteTop.com',
      linkedIn: 'eduMacedo99',
      password: 'souRei',
      company: 'Influencers C.A.',
      bio: 'Eduardo is the King he is very handsome he programs a lot, xD.',
      twitter: 'edudududu'
    );
    addParticipant(
      name: 'Chico da Tina',
      email: 'chico@tina.com',
      photo: 'images/photo.png',
      gitHub: 'chico_tina',
      password: 'freicken'
    );
  }

  void addDefault(){
    var _default = Participant(
      name: 'Chico da Tina',
      email: 'Chicod@Tina.com',
      website: 'tina.com',
      linkedIn: 'tina',
      company: 'Nas Drogas xisdê',
    );
    participants[999] = _default;
  }

  int findParticipantByEmail(String email) {
    int result = -1;
    participants.forEach((key, val) {
      if (participants[key].email == email)
        result = key;
    });
    return result;
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
