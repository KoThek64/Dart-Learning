import 'package:bibliotheque/models/createur.dart';
import 'package:bibliotheque/models/livre.dart';

class Auteur extends Createur{
  final List<Livre> _livres;

  Auteur({
    required super.nom,
    required super.prenom,
    required super.dateNaissance,
    required super.nationalite,
    List<Livre>? livres,
  }) : _livres = livres ?? [];

  List<Livre> get livres => List.unmodifiable(_livres);

  int getNombresLivres() => _livres.length;

  void ajouterLivre(Livre livre){
    _livres.add(livre);
  }
}