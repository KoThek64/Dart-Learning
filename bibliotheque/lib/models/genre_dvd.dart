enum GenreDVD {
  action('Action'),
  comedie('Comédie'),
  drame('Drame'),
  horreur('Horreur'),
  scienceFiction('Science-Fiction'),
  fantastique('Fantastique'),
  thriller('Thriller'),
  animation('Animation'),
  documentaire('Documentaire'),
  romance('Romance'),
  aventure('Aventure'),
  policier('Policier'),
  musical('Musical'),
  western('Western'),
  biopic('Biopic');

  final String label;
  const GenreDVD(this.label);
}
