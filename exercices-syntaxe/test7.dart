// 1. La classe de base
abstract class Personnage {
  String nom;
  int pointsDeVie;
  String alliance;
  Personnage(this.nom, this.pointsDeVie, this.alliance);

  void saluer() => print("Je suis $nom !");
}

// 2. Une interface ou classe pour les utilisateurs de magie
abstract class Magicien extends Personnage {
  int mana;
  Magicien(String nom, int hp, String alliance,this.mana) : super(nom, hp, alliance);
}

// 3. Le Mixin avec contrainte : utilisable UNIQUEMENT par un Magicien
mixin SortDeFeu on Magicien {
  void lancerBouleDeFeu() {
    if (mana >= 10) {
      mana -= 10;
      print("$nom lance une boule de feu ! 🔥 (Mana restant : $mana)");
    } else {
      print("Pas assez de mana...");
    }
  }
}

// 4. Implémentation
class MageDeGuerre extends Magicien with SortDeFeu {
  MageDeGuerre(String nom) : super(nom, 100, "", 50);
}

// 5. Ce qui ne fonctionnerait PAS :
// class Guerrier extends Personnage with SortDeFeu { ... }
// ^ Erreur ! Guerrier n'hérite pas de Magicien.