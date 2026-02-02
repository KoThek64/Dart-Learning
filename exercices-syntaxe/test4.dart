// =====================
// Exemple 1 : Classe simple
// =====================

/// Classe représentant un point en 2D (exemple minimaliste)
class Point {
  // Attributs publics non-nullables
  double x;
  double y;

  /// Constructeur principal
  Point(this.x, this.y);

  /// Méthode d'affichage
  void afficher() {
    print('Point($x, $y)');
  }

  /// Méthode pour changer
  void changer(double x2, double y2) {
    this.x = x2;
    this.y = y2;
  }

  /// Redéfinition de toString pour un affichage personnalisé
  @override
  String toString() => 'Point($x, $y)';
}

// =====================
// Exemple 2 : Classe moyenne
// =====================

/// Classe représentant un rectangle avec méthodes et getters
class Rectangle {
  // Attributs publics
  double largeur;
  double hauteur;

  /// Constructeur principal
  Rectangle({required this.largeur, required this.hauteur});

  /// Getter pour l'aire (propriété calculée)
  double get aire => largeur * hauteur;

  /// Getter pour le périmètre
  double get perimetre => 2 * (largeur + hauteur);

  /// Méthode pour vérifier si le rectangle est un carré
  bool estCarre() => largeur == hauteur;

  /// Méthode pour redimensionner le rectangle
  void redimensionner(double facteur) {
    largeur *= facteur;
    hauteur *= facteur;
  }

  /// Redéfinition de toString
  @override
  String toString() => 'Rectangle($largeur x $hauteur)';

  /// Redéfinition de l'opérateur == pour comparer deux rectangles
  @override
  bool operator ==(Object autre) {
    if (autre is! Rectangle) return false;
    return largeur == autre.largeur && hauteur == autre.hauteur;
  }

  /// Redéfinition de hashCode (toujours avec ==)
  @override
  int get hashCode => largeur.hashCode ^ hauteur.hashCode;
}

// =====================
// Exemple 3 : Classe complexe
// =====================

/// Classe représentant un compte bancaire avec encapsulation, validation, opérateurs et méthodes asynchrones
class CompteBancaire {
  // Attributs privés (encapsulation)
  double _solde;
  final String _titulaire;
  final List<String> _historique = [];

  /// Constructeur principal
  CompteBancaire(this._titulaire, [this._solde = 0]);

  /// Getter public pour lire le solde
  double get solde => _solde;

  /// Getter public pour lire le titulaire
  String get titulaire => _titulaire;

  /// Getter pour l'historique (lecture seule)
  List<String> get historique => List.unmodifiable(_historique);

  /// Déposer de l'argent (méthode publique)
  void deposer(double montant) {
    if (montant <= 0) throw Exception('Montant invalide');
    _solde += montant;
    _historique.add('Dépôt: +$montant');
  }

  /// Retirer de l'argent (méthode publique)
  void retirer(double montant) {
    if (montant <= 0 || montant > _solde) throw Exception('Retrait impossible');
    _solde -= montant;
    _historique.add('Retrait: -$montant');
  }

  /// Méthode privée pour calculer un code secret (exemple)
  // int _calculerCodeSecret() => _titulaire.hashCode ^ _solde.hashCode;

  /// Méthode asynchrone simulant une opération longue (ex: virement)
  Future<void> virement(CompteBancaire destinataire, double montant) async {
    await Future.delayed(Duration(seconds: 1));
    retirer(montant);
    destinataire.deposer(montant);
    _historique.add('Virement de $montant à ${destinataire.titulaire}');
  }

  /// Surcharge de l'opérateur + pour fusionner deux comptes (additionne les soldes)
  CompteBancaire operator +(CompteBancaire autre) {
    return CompteBancaire(
      '${_titulaire} & ${autre._titulaire}',
      _solde + autre._solde,
    );
  }

  /// Redéfinition de toString
  @override
  String toString() => 'Compte de $_titulaire : $_solde €';
}

// =====================
// Exemples d'utilisation dans main()
// =====================

void main() {
  // Classe simple
  var p = Point(2, 3);
  p.afficher();
  print(p);

  // Classe moyenne
  var rect = Rectangle(largeur: 5, hauteur: 10);
  print(rect.aire);
  print(rect.estCarre());
  rect.redimensionner(2);
  print(rect);

  // Classe complexe
  var compte1 = CompteBancaire('Alice', 100);
  var compte2 = CompteBancaire('Bob', 50);
  compte1.deposer(50);
  compte1.retirer(30);
  print(compte1.historique);
  print(compte1);

  // Opérateur +
  var compteFusion = compte1 + compte2;
  print(compteFusion);
}
