// 1. L'Héritage : définit ce que l'objet EST
class Animal {
  void manger() => print("L'animal mange... 🍎");
}

// 2. Le Mixin : définit ce que l'objet peut FAIRE (une capacité)
mixin Marcheur {
  void marcher() => print("Je marche sur le sol 🐾");
}

// 3. Application
class Chat extends Animal with Marcheur {
  // Le chat EST un animal (héritage)
  // Le chat a la CAPACITÉ de marcher (mixin)
}

class Serpent extends Animal {
  // Le serpent EST un animal, mais il ne marche pas.
  // Il n'utilise donc pas le mixin Marcheur.
}

void main() {
  var monChat = Chat();
  monChat.manger();  // Provient de Animal
  monChat.marcher(); // Provient de Marcheur
  var monSerpent = Serpent();
  monSerpent.manger();
}