import 'package:bibliotheque/models/auteur.dart';
import 'package:bibliotheque/models/livre.dart';
import 'package:bibliotheque/models/genre_livre.dart';
import 'package:bibliotheque/models/realisateur.dart';
import 'package:bibliotheque/models/dvd.dart';
import 'package:bibliotheque/models/genre_dvd.dart';
import 'package:bibliotheque/models/classification_age.dart';
import 'package:bibliotheque/models/nationalites.dart';
import 'package:bibliotheque/models/recompenses.dart';

void main(List<String> arguments) {
  print('=== Test des classes Bibliothèque ===\n');

  // --- Test Auteur et Livre ---
  print('--- LIVRES ---');

  // Créer un auteur (avec liste vide pour éviter la dépendance circulaire)
  final victorHugo = Auteur(
    nom: 'Hugo',
    prenom: 'Victor',
    dateNaissance: DateTime(1802, 2, 26),
    nationalite: Nationalite.francaise,
    livres: [],
  );

  // Créer un livre avec cet auteur
  final lesMiserables = Livre(
    titre: 'Les Misérables',
    dateCreation: DateTime(1862, 4, 3),
    auteur: victorHugo,
    nombrePages: 1900,
    genre: GenreLivre.roman,
  );

  // Ajouter le livre à l'auteur
  victorHugo.ajouterLivre(lesMiserables);

  // Tester les méthodes
  print(lesMiserables.description());
  print('Genre: ${lesMiserables.genre.label}');
  print('Âge du livre: ${lesMiserables.getAge()} ans');
  print('Temps de lecture estimé: ${lesMiserables.estimationTempsLecture()}');
  print('Auteur: ${victorHugo.getNomEntier()} (${victorHugo.nationalite.label})');
  print('Nombre de livres: ${victorHugo.getNombresLivres()}');

  print('\n--- DVD ---');

  // --- Test Réalisateur et DVD ---
  final christopherNolan = Realisateur(
    nom: 'Nolan',
    prenom: 'Christopher',
    dateNaissance: DateTime(1970, 7, 30),
    nationalite: Nationalite.britannique,
    filmographie: [],
    recompenses: [Recompense.oscar, Recompense.bafta],
  );

  final inception = DVD(
    titre: 'Inception',
    dateCreation: DateTime(2010, 7, 16),
    realisateur: christopherNolan,
    duree: Duration(hours: 2, minutes: 28),
    genre: GenreDVD.scienceFiction,
    classificationAge: ClassificationAge.moins12,
  );

  christopherNolan.ajouterDVD(inception);

  // Tester les méthodes
  print(inception.description());
  print('Classification: ${inception.getClassificationAge()}');
  print('Est un long métrage: ${inception.estLongMetrage()}');
  print('Réalisateur: ${christopherNolan.getNomEntier()}');
  print('Initiales: ${christopherNolan.getInitiales()}');
  print('A gagné un Oscar: ${christopherNolan.aGagne(Recompense.oscar)}');
  print('A gagné une Palme d\'Or: ${christopherNolan.aGagne(Recompense.palmeOr)}');
  print('Nombre de films: ${christopherNolan.getNombresFilms()}');

  print('\n--- Test Classification Age ---');
  final ageSpectateur = 14;
  print('Un spectateur de $ageSpectateur ans peut voir Inception: ${inception.classificationAge.peutVoir(ageSpectateur)}');

  print('\n=== Fin des tests ===');
}
