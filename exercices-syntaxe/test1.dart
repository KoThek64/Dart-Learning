void main(){
  print("hello world !");
  String? name = "Mattys";
  print(name);
  int age = 25;

  if (age > 18){
    print("Tu es majeur");
  } else {
    print("Tu es mineur");
  }

  late String description = des();
  print(description);

}

String des(){
  return "DESCRIPTION";
}