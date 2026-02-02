import 'package:bibliotheque/models/classification_age.dart';
import 'package:bibliotheque/models/genre_dvd.dart';
import 'package:bibliotheque/models/media.dart';
import 'package:bibliotheque/models/realisateur.dart';

class DVD extends Media {
  final Realisateur realisateur;
  final Duration duree;
  final GenreDVD genre;
  final ClassificationAge classificationAge;

  DVD({
    required super.titre,
    required super.dateCreation,
    required this.realisateur,
    required this.duree,
    required this.genre,
    required this.classificationAge
  });

  @override
  String description() {
    return "${super.description()} par ${realisateur.getNomEntier()}, il dure exactement $duree, il est de genre ${genre.label} et est ${classificationAge.label}";
  }

  bool estLongMetrage(){
    return duree.inHours >= 1;
  }

  String getClassificationAge(){
    return classificationAge.label;
  } 
}
