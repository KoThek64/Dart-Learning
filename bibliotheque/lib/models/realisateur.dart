import 'package:bibliotheque/models/createur.dart';
import 'package:bibliotheque/models/dvd.dart';
import 'package:bibliotheque/models/recompenses.dart';

class Realisateur extends Createur {
  final List<DVD> _filmographie;
  final List<Recompense> _recompenses;

  Realisateur({
    required super.nom,
    required super.prenom,
    required super.dateNaissance,
    required super.nationalite,
    List<DVD>? filmographie,
    List<Recompense>? recompenses,
  }) : _filmographie = filmographie ?? [],
       _recompenses = recompenses ?? [];

  List<DVD> get filmographie => List.unmodifiable(_filmographie);
  List<Recompense> get recompenses => List.unmodifiable(_recompenses);

  int getNombresFilms() {
    return _filmographie.length;
  }

  bool aGagne(Recompense recompense) {
    return _recompenses.contains(recompense);
  }

  void ajouterDVD(DVD dvd) {
    _filmographie.add(dvd);
  }

  void ajouterRecompense(Recompense recompense){
    _recompenses.add(recompense);
  }
}
