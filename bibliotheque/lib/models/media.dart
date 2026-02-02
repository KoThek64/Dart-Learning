abstract class Media {
  final String titre;
  final DateTime dateCreation;

  Media({required this.titre, required this.dateCreation});

  String description() {
    return "$titre a été créé en $dateCreation";
  }

  int getAge() {
    final now = DateTime.now();
    int age = now.year - dateCreation.year;
    if (now.month < dateCreation.month || (now.month == dateCreation.month && now.day < dateCreation.day )){
      age--;
    }
    return age;
  }
}
