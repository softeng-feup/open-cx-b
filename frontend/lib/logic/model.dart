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
  int fgRed;
  int fgGreen;
  int fgBlue;
  int bgRed;
  int bgGreen;
  int bgBlue;
  bool wantsPhoto = true;

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
        this.fgRed,
        this.fgGreen,
        this.fgBlue,
        this.bgRed,
        this.bgGreen,
        this.bgBlue,
        this.wantsPhoto});
}
