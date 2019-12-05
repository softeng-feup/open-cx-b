class Participant {
  int id;
  String name;
  String bio;
  String email;
  String password;
  String company;
  String position;
  String website;
  String linkedIn;
  String gitHub;
  String twitter;
  String photo;
  String cv;
  List<int> lectures = List();
  List<int> connections = List();
  List<String> cardAttributes = List();
  int red;
  int green;
  int blue;

  Participant(
      {this.id,
      this.name,
      this.bio,
      this.email,
      this.password,
      this.company,
      this.position,
      this.website,
      this.linkedIn,
      this.gitHub,
      this.twitter,
      this.photo,
      this.cv,
      this.lectures,
      this.cardAttributes,
      this.connections,
      this.red,
      this.green,
      this.blue});
}

class Sponsor {
  int id;
  String name;
  String logo;
  List<String> businessAreas = List();
  List<int> representatives = List();
  String slogan;
  String website;
  String promotionalVideo;
  List<String> cardAttributes = List();

  Sponsor(
      {this.id,
      this.name,
      this.logo,
      this.businessAreas,
      this.slogan,
      this.website,
      this.promotionalVideo,
      this.representatives,
      this.cardAttributes});
}

class Lecture {
  int id;
  String title;
  String description;
  DateTime startTime;
  DateTime endTime;
  List<int> speakers = List();

  Lecture(
      {this.id,
      this.title,
      this.description,
      this.startTime,
      this.endTime,
      this.speakers});
}
