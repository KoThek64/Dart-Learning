import 'package:bibliotheque/models/classification_age.dart';
import 'package:bibliotheque/models/dvd.dart';
import 'package:bibliotheque/models/genre_dvd.dart';
import 'package:bibliotheque/models/nationalites.dart';
import 'package:bibliotheque/models/realisateur.dart';
import 'package:bibliotheque/models/recompenses.dart';
import 'package:test/test.dart';

void main() {
  group('Réalisateur', () {
    late Realisateur realisateur;

    setUp(() {
      realisateur = Realisateur(
        nom: 'Nolan',
        prenom: 'Christopher',
        dateNaissance: DateTime(1970, 7, 30),
        nationalite: Nationalite.britannique,
        filmographie: [],
        recompenses: [],
      );
    });

    test('getNombreFilms retourne 0 car pas de films', () {
      expect(0, realisateur.getNombresFilms());
    });

    test("aGagne(recompense) renvoie false si vide", () {
      expect(false, realisateur.aGagne(Recompense.bafta));
    });

    test("aGagne(recompense) renvoir true si là", () {
      realisateur.ajouterRecompense(Recompense.bafta);
      expect(true, realisateur.aGagne(Recompense.bafta));
    });

    test("aGagne(recompense) renvoie false si pas là", () {
      expect(false, realisateur.aGagne(Recompense.oscar));
    });

    test("ajouterDVD fonctionne", () {
      final dvd = DVD(
        titre: "titre",
        dateCreation: DateTime.now(),
        realisateur: realisateur,
        duree: Duration(hours: 2, minutes: 30),
        genre: GenreDVD.action,
        classificationAge: ClassificationAge.moins12,
      );
      realisateur.ajouterDVD(dvd);
      expect(1, realisateur.filmographie.length);
      expect(dvd, realisateur.filmographie[0]);
    });
  });
}
