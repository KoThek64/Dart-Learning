import 'package:test/test.dart';
import 'package:bibliotheque/models/auteur.dart';
import 'package:bibliotheque/models/livre.dart';
import 'package:bibliotheque/models/genre_livre.dart';
import 'package:bibliotheque/models/nationalites.dart';

void main() {
  // group() permet de regrouper des tests liés
  group('Auteur', () {

    // Variables réutilisables pour les tests
    late Auteur auteur;

    // setUp() s'exécute AVANT chaque test
    // Utile pour initialiser des données fraîches
    setUp(() {
      auteur = Auteur(
        nom: 'Hugo',
        prenom: 'Victor',
        dateNaissance: DateTime(1802, 2, 26),
        nationalite: Nationalite.francaise,
      );
    });

    // test() définit un test individuel
    test('getNomEntier() retourne le prénom suivi du nom', () {
      // expect(valeurObtenue, valeurAttendue)
      expect(auteur.getNomEntier(), 'Victor Hugo');
    });

    test('getNombresLivres() retourne 0 pour un nouvel auteur', () {
      expect(auteur.getNombresLivres(), 0);
    });

    test('ajouterLivre() incrémente le nombre de livres', () {
      // Créer un livre
      final livre = Livre(
        titre: 'Les Misérables',
        dateCreation: DateTime(1862),
        auteur: auteur,
        nombrePages: 1900,
        genre: GenreLivre.roman,
      );

      // Ajouter le livre
      auteur.ajouterLivre(livre);

      // Vérifier que le compteur a augmenté
      expect(auteur.getNombresLivres(), 1);
    });

    test('livres retourne une liste non modifiable', () {
      // Tenter de modifier la liste retournée par le getter
      // Doit lancer une erreur car c'est List.unmodifiable()
      expect(
        () => auteur.livres.add(Livre(
          titre: 'Test',
          dateCreation: DateTime.now(),
          auteur: auteur,
          nombrePages: 100,
          genre: GenreLivre.roman,
        )),
        throwsA(isA<UnsupportedError>()),  // Attend une erreur
      );
    });

    test('getInitiales() retourne les initiales', () {
      expect(auteur.getInitiales(), 'V H');
    });

  });

  // Un autre groupe pour tester la création avec des livres
  group('Auteur avec livres initiaux', () {

    test('peut être créé avec une liste de livres', () {
      final auteur = Auteur(
        nom: 'Dumas',
        prenom: 'Alexandre',
        dateNaissance: DateTime(1970, 7, 30),
        nationalite: Nationalite.francaise,
      );

      final livre1 = Livre(
        titre: 'Les Trois Mousquetaires',
        dateCreation: DateTime(1844),
        auteur: auteur,
        nombrePages: 700,
        genre: GenreLivre.roman,
      );

      final livre2 = Livre(
        titre: 'Le Comte de Monte-Cristo',
        dateCreation: DateTime(1844),
        auteur: auteur,
        nombrePages: 1200,
        genre: GenreLivre.roman,
      );

      auteur.ajouterLivre(livre1);
      auteur.ajouterLivre(livre2);

      expect(auteur.getNombresLivres(), 2);
    });

  });
}
