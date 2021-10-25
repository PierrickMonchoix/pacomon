import 'package:first_flutter_app/modele/element_terrain.dart';

class Carte {
  static const taille = 15;

  List<List<ElementTerrain>> _matriceElementTerrain = List.generate(
      taille, (i) => List.generate(taille, (j) => ElementTerrain.vide()));

  Carte();

  void setMatrice({required List<List<ElementTerrain>> matriceElementTerrain}) {
    for (int y = 0; y < taille; y++) {
      for (int x = 0; x < taille; x++) {
        _matriceElementTerrain[y][x].copy(matriceElementTerrain[y][x]);
      }
    }

  }

  ElementTerrain getElementTerrainFromCoord({required int y, required int x}) {
    return _matriceElementTerrain[y][x];
  }

  @override
  String toString() => 'Carte(_matriceElementTerrain: $_matriceElementTerrain)';
}
