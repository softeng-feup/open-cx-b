class BusinessCard{
  int redValue = 0;
  int greenValue = 0;
  int blueValue = 0;
  String name = "Placeholder Name";
  String email = "Placeholder Email";
  String linkedIn = "Placeholder linkedIn";


  int id= -1;
  BusinessCard(int r, int g, int b, String nameInput, String emailInput, String linkedInInput){
    redValue = r;
    greenValue = g;
    blueValue = b;
    name = nameInput;
    email = emailInput;
    linkedIn = linkedInInput;
  }
}