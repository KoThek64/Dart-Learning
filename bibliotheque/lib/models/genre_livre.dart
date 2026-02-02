enum GenreLivre {
  roman('Roman'),
  scienceFiction('Science-Fiction'),
  fantastique('Fantastique'),
  policier('Policier'),
  biographie('Biographie'),
  histoire('Histoire'),
  poesie('Poésie');

  final String label;
  const GenreLivre(this.label);
}
