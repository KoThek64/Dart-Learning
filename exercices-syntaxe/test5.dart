enum PlanetType { terrarrial, gas, ice }

enum Planet {
  Terre(planetType: PlanetType.terrarrial, moons: 1, hasRings: false);

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });
}

void main() {
  final yourPlanet = Planet.Terre;
  Planet myPlanet = .Terre;

  if (!yourPlanet.hasRings) {
    print('Your planet is not a "giant planet".');
  }
}
