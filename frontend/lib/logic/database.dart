import 'dart:core';

import 'package:cardy_b/logic/model.dart';

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
      website: 'sitedoedu.com',
      linkedIn: 'eduMacedo99',
      password: 'souRei',
      company: 'Cardy B Inc',
      bio: 'Hello all, I am Eduardo and I love mashed potatos',
      twitter: 'edudududu',
      red: 240,
      green: 94,
      blue: 35,
      connections: [1, 2, 3, 4]
    );
    addParticipant(
      name: 'Chico da Tina',
      email: 'chico@tina.com',
      photo: 'images/photo.png',
      gitHub: 'chico_tina',
      password: 'freicken',
      linkedIn: 'MinhoTrapstar',
      twitter: 'TriangleChest',
      website: 'freicken.co.uk',
      red: 20,
      green: 120,
      blue: 83,
    );
    addParticipant(
      name: 'João Macedo',
      email: 'macedo_is_me@gmail.com',
      photo: 'images/macedophoto.jpg',
      website: 'macedo_faz_webdev.com',
      password: 'jadiziaaminhaavo:zas!',
      linkedIn: 'cedo_networking',
      twitter: 'cedo_do_sitio',
      red: 240,
      green: 94,
      blue: 35,
    );
    addParticipant(
      name: 'João Matos',
      email: 'jopoaopao@mail.com',
      photo: 'images/matosphoto.jpg',
      website: 'joaonmatos.com',
      password: 'jadiziaaminhaavo:zas!',
      linkedIn: 'joaomatosofficial2019',
      twitter: 'joaozinhodascouves',
      red: 69,
      green: 130,
      blue: 20,
    );
    addParticipant(
      name: 'Miguel, o Simões',
      email: 'miguel@miguel.com.br',
      photo: 'images/miguelphoto.jpg',
      gitHub: 'xX_miguel_Xx',
      password: 'miguel',
      linkedIn: 'xX_miguel_Xx',
      website: 'xX_miguel_Xx',
      twitter: 'xX_miguel_Xx',
      red: 230,
      green: 20,
      blue: 83,
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
      List<int> connections,
      int red,
      int green,
      int blue,
      }) {
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
        connections: connections,
        red: red,
        green: green,
        blue: blue,
    );
    participants[id] = participant;
  }
}
