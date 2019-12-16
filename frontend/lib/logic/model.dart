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
      this.cardAttributes,
      this.connections,
      this.red,
      this.green,
      this.blue});
}

