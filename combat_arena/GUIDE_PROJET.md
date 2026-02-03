# Combat Arena - Guide de Projet

> Projet d'apprentissage Dart : Mixins, Héritage et Polymorphisme

## Contexte

Ce projet fait suite à un exercice de gestion de médiathèque qui a permis de comprendre les classes et l'encapsulation avec `extends`. L'objectif ici est d'apprendre :

- **L'héritage vertical** (`extends`) : "Est un" → Un Guerrier **est un** Combattant
- **La composition horizontale** (`with`) : "Peut faire" → Un Guerrier **peut faire** un coup critique
- **La contrainte de mixin** (`on`) : Limite l'usage → `mixin Magie on Mage` (seul un Mage peut l'avoir)
- **Le polymorphisme** : L'arène manipule des `Combattant`, peu importe leur classe concrète

---

## Structure du Projet

```
combat_arena/
├── bin/
│   └── main.dart              # Point d'entrée
├── lib/
│   ├── models/
│   │   ├── combattant.dart    # Classe abstraite de base
│   │   └── classes_rpg.dart   # Guerrier, Rodeur, Pretre, Mage, etc.
│   ├── mixins/
│   │   └── capacites.dart     # Soin, Esquive, CoupCritique, Magie, etc.
│   └── logic/
│       └── arene.dart         # Boucle de combat
```

---

## Fichier 1 : `lib/models/combattant.dart`

### La classe abstraite de base - Le contrat que tous les combattants doivent respecter

### Propriétés à implémenter

| Élément | Type | Description |
|---------|------|-------------|
| `nom` | `String` | Nom du personnage |
| `pvMax` | `int` | PV maximum (pour les soins, ne pas dépasser) |
| `pv` | `int` | Points de vie actuels |
| `attaque` | `int` | Dégâts de base |
| `defense` | `int` | Réduit les dégâts reçus |
| `vitesse` | `int` | Détermine qui attaque en premier |

### Méthodes/Getters à implémenter

| Élément | Type | Description |
|---------|------|-------------|
| `estVivant` | `bool` (getter) | `pv > 0` |
| `recevoirDegats(int)` | méthode | Applique dégâts - defense, minimum 1 |
| `attaquer(Combattant)` | méthode | Inflige des dégâts à la cible |

### Idée bonus

- Une méthode `String get statusBar` qui retourne une barre de vie ASCII : `[████████░░] 80/100`

---

## Fichier 2 : `lib/mixins/capacites.dart`

### Les mixins - blocs de comportements réutilisables

### Mixins de base

| Mixin | Contrainte | Effet |
|-------|------------|-------|
| `Soin` | `on Combattant` | `soigner(int montant)` - remonte les PV sans dépasser `pvMax` |
| `Esquive` | `on Combattant` | `tenterEsquive()` → `bool` (20-30% de chance) |
| `CoupCritique` | `on Combattant` | `calculerDegats(int base)` → double si critique (15% chance) |
| `Magie` | `on Mage` | Nécessite `mana`, `lancerSort(Combattant, int cout)` |

### Mixins supplémentaires (suggestions)

| Mixin | Contrainte | Effet |
|-------|------------|-------|
| `Rage` | `on Combattant` | Plus les PV sont bas, plus l'attaque augmente |
| `Vampirisme` | `on Combattant` | Récupère un % des dégâts infligés en PV |
| `Bouclier` | `on Combattant` | `activerBouclier()` - absorbe X dégâts avant de casser |
| `Poison` | `on Combattant` | `empoisonner(Combattant)` - dégâts sur plusieurs tours |
| `Contre` | `on Combattant` | Chance de riposter automatiquement quand attaqué |

---

## Fichier 3 : `lib/models/classes_rpg.dart`

### Les classes concrètes qui héritent de Combattant et utilisent les mixins

### Classes de base

| Classe | Hérite | Mixins | Caractéristiques |
|--------|--------|--------|------------------|
| `Guerrier` | `Combattant` | `CoupCritique`, `Rage` | PV élevés, attaque forte |
| `Rodeur` | `Combattant` | `Esquive`, `CoupCritique` | PV faibles, très agile |
| `Pretre` | `Combattant` | `Soin` | PV moyens, peut se soigner |
| `Mage` | `Combattant` | - | A `mana` et `manaMax` (pour le mixin Magie) |

### Classes supplémentaires (suggestions)

| Classe | Hérite | Mixins | Caractéristiques |
|--------|--------|--------|------------------|
| `Paladin` | `Combattant` | `Soin`, `Bouclier` | Tank qui se soigne |
| `Assassin` | `Combattant` | `Esquive`, `CoupCritique`, `Poison` | Dégâts massifs, fragile |
| `Berserker` | `Combattant` | `Rage`, `Vampirisme` | Plus il est blessé, plus il est dangereux |
| `Necromancien` | `Mage` | `Magie`, `Vampirisme` | Mage qui vole la vie |
| `Chevalier` | `Combattant` | `Bouclier`, `Contre` | Défensif, punit les attaquants |

---

## Fichier 4 : `lib/logic/arene.dart`

### La logique de combat - le moteur qui fait tourner les combats

### Méthodes à implémenter

| Élément | Description |
|---------|-------------|
| `Arene(Combattant c1, Combattant c2)` | Constructeur |
| `lancerCombat()` | Boucle principale tant que les deux sont vivants |
| `_determinerOrdre()` | Qui attaque en premier (basé sur `vitesse`) |
| `_executerTour(attaquant, defenseur)` | Un tour de combat |
| `_afficherEtatCombat()` | Affiche les barres de vie des deux combattants |

### Idées avancées

| Fonction | Description |
|----------|-------------|
| `lancerTournoi(List<Combattant>)` | Tournoi à élimination directe |
| `combatParEquipe(List, List)` | 2v2 ou 3v3 |
| `ajouterSpectateur(Function)` | Callback pour logger les événements |
| Gestion des **effets de statut** | Poison tick, bouclier qui expire, etc. |

---

## Fichier 5 : `bin/main.dart`

### Point d'entrée - Crée les combattants et lance l'arène

### À implémenter

- Importer les fichiers nécessaires
- Créer plusieurs combattants de différentes classes
- Lancer des combats 1v1
- (Bonus) Menu interactif pour choisir les combattants

---

## Ordre de développement suggéré

1. **`combattant.dart`** → La base, teste avec `print()`
2. **`capacites.dart`** → Les mixins simples d'abord (Soin, CoupCritique)
3. **`classes_rpg.dart`** → 2-3 classes pour tester les mixins
4. **`arene.dart`** → Combat basique
5. **Itérer** : ajouter mixins → nouvelles classes → améliorer l'arène

---

## Checklist de progression

### Étape 1 : Fondations
- [ ] Classe abstraite `Combattant` avec propriétés de base
- [ ] Getter `estVivant`
- [ ] Méthode `recevoirDegats()`
- [ ] Méthode `attaquer()`

### Étape 2 : Mixins de base
- [ ] Mixin `Soin`
- [ ] Mixin `Esquive`
- [ ] Mixin `CoupCritique`

### Étape 3 : Premières classes
- [ ] Classe `Guerrier`
- [ ] Classe `Rodeur`
- [ ] Classe `Pretre`

### Étape 4 : Arène basique
- [ ] Constructeur avec 2 combattants
- [ ] Méthode `lancerCombat()` fonctionnelle
- [ ] Affichage du vainqueur

### Étape 5 : Magie
- [ ] Classe `Mage` avec `mana` et `manaMax`
- [ ] Mixin `Magie` avec contrainte `on Mage`

### Étape 6 : Extensions (bonus)
- [ ] Mixins supplémentaires (Rage, Vampirisme, Bouclier, Poison, Contre)
- [ ] Classes avancées (Paladin, Assassin, Berserker, etc.)
- [ ] Tournoi
- [ ] Combat par équipe
- [ ] Effets de statut persistants

---

## Notes et questions pour les prochaines sessions

_Espace pour noter les blocages, questions ou idées en cours de développement_

