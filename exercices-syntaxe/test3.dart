void main() {
  //Numbers
  var hex = 0xDEADBEEF;
  var exponents = 1.42e5;

  print(hex);
  print(exponents);

  num ol = 1;
  ol += 2.5;
  print(ol);
  ol -= 2.5;
  print(ol);

  var one = int.parse('1');
  print(one == 1);

  String oneAsString = 1.toString();
  print(oneAsString == '1');

  String pi = 3.14159.toStringAsFixed(2);
  print(pi == '3.14');

  var n5 = 0x00_14_22_01_23_45;
  print(n5);

  //String
  String s = 'string interpolation';
  print(
    'Dart has $s, which is very handy.' ==
        'Dart has string interpolation, which is very handy.',
  );

  var hi = 'Hi \u2665';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');

  //Records
  var record = (2, 1);

  (int, int) swap((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  print(swap(record));

  ({String a, int b, bool c})? test;

  print(test);
  test = (a: 'String', b: 2, c: true);
  print(test);

  //Exemple calcul
  ({int somme, int produit, int minus}) calculer(int a, int b) {
    return (somme: a + b, produit: a * b, minus: a - b);
  }

  int a = 2;
  int b = 5;
  print(calculer(a, b));

  //Exemple validation formulaire
  ({bool valide, String erreur}) validerMDP(String mdp) {
    if (mdp.length < 8) {
      return (valide: false, erreur: "Trop court");
    }
    if (!mdp.contains(RegExp(r'[0-9]'))) {
      return (valide: false, erreur: "Pas de chiffres");
    }
    return (valide: true, erreur: "");
  }

  print(validerMDP("13247780Hm!!"));
  print(validerMDP("lol"));
  print(validerMDP("mpoklmpoik"));

  //Exemple dans une liste
  ({bool trouve, int index, String element}) chercher(
    List<String> liste,
    String recherche,
  ) {
    for (int i = 0; i < liste.length; i++) {
      if (liste[i] == recherche) {
        return (trouve: true, index: i, element: liste[i]);
      }
    }
    return (trouve: false, index: -1, element: "");
  }

  List<String> courses = ["pain", "lait", "œufs"];

  print(chercher(courses, "lait"));

  Set<int> nombres = {5, 2, 8, 1, 9};

  // Les Sets ne sont pas triés, on passe par une List
  List<int> tri = nombres.toList()..sort();

  print(tri);

  Set<int> nombresTrie = tri.toSet();

  print(nombresTrie);
}
