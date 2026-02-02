import 'package:bibliotheque/models/nationalites.dart';

abstract class Createur {
  final String nom;
  final String prenom;
  final DateTime dateNaissance;
  final Nationalite nationalite;

  Createur({
    required this.nom,
    required this.prenom,
    required this.dateNaissance,
    required this.nationalite,
  });

  /// Calcule l'âge dynamiquement à partir de la date de naissance
  int get age {
    final now = DateTime.now();
    int age = now.year - dateNaissance.year;
    // Si l'anniversaire n'est pas encore passé cette année, on retire 1
    if (now.month < dateNaissance.month ||
        (now.month == dateNaissance.month && now.day < dateNaissance.day)) {
      age--;
    }
    return age;
  }

  String getNomEntier() {
    return "$prenom $nom";
  }

  String getInitiales() {
    return "${prenom[0].toUpperCase()} ${nom[0].toUpperCase()}";
  }
}
