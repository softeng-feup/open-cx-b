import 'model.dart';
import 'dart:core';
class Database {
  static final Database _instance = Database._internal();
  factory Database()  {
    return _instance;
  }
  Database._internal();
  int _nextParticipantId = 0;
  int _nextSponsorId = 0;
  int _nextLectureId = 0;

  Map<int, Participant> participants = Map();
  Map<int, Sponsor> sponsors = Map();
  Map<int, Lecture> lectures = Map();
}
