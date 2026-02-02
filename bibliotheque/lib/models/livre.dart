import 'package:bibliotheque/models/auteur.dart';
import 'package:bibliotheque/models/genre_livre.dart';
import 'package:bibliotheque/models/media.dart';

class Livre extends Media {
  final Auteur auteur;
  final int nombrePages;
  final GenreLivre genre;

  Livre({
    required super.titre,
    required super.dateCreation,
    required this.auteur,
    required this.nombrePages,
    required this.genre
  });

  @override                                                                                                                                                                                   
  String description() {                                                                                                                                                                      
    return "${super.description()} par ${auteur.getNomEntier()}, il possède $nombrePages pages et le genre est ${genre.label}";                                                                                        
  }

  Duration estimationTempsLecture({int pagesParHeure = 30}) {                                                                                                                                 
    final minutes = (nombrePages / pagesParHeure * 60).round();                                                                                                                               
    return Duration(minutes: minutes);                                                                                                                                                        
  }

}
