import 'dart:io';

void main() {
  List<String?> taches = [];
  bool continuer = true;

  while (continuer) {
    print(Process.runSync("clear", [], runInShell: true).stdout);
    print("CLI TODO");
    for (int i = 0; i < taches.length; i++) {
      print(i.toString() + " " + taches[i].toString());
    }
    print("1 - Ajouter une tache");
    print("2 - Supprimer une tâche");
    print("3 - Quitter");
    String? choix = stdin.readLineSync();

    switch (choix) {
      case "1":
        taches.add(ajouter());
      case "2":
        int? index = supprimer();
        if (index != null && index < taches.length && index >= 0) {
          taches.removeAt(index);
        }
      case "3":
        continuer = false;
    }
  }
  print("tchao");
}

String? ajouter() {
  print("Veuillez saisir la tâche à rajouter");
  String? msg = stdin.readLineSync();
  return msg;
}

int? supprimer() {
  print("Veuillez saisir l'index de la tâche a supprimer");
  String? input = stdin.readLineSync();
  return int.tryParse(input ?? "");
}
