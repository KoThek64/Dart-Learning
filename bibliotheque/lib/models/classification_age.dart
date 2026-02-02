enum ClassificationAge {
  toutPublic('Tout public', 0),
  moins10('Déconseillé aux moins de 10 ans', 10),
  moins12('Interdit aux moins de 12 ans', 12),
  moins16('Interdit aux moins de 16 ans', 16),
  moins18('Interdit aux moins de 18 ans', 18);

  final String label;
  final int ageMinimum;
  const ClassificationAge(this.label, this.ageMinimum);

  // Vérifie si un âge donné peut voir le film
  bool peutVoir(int age) => age >= ageMinimum;
}
