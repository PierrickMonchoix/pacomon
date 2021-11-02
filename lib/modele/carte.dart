import 'package:pacomon/modele/element_terrain.dart';

class Carte {
  static late int tailleX;
  static late int tailleY;

  List<List<ElementTerrain>> _matriceElementTerrain = List.generate(
      tailleY, (i) => List.generate(tailleX, (j) => ElementTerrain.vide()));

  Carte.vide();

  Carte({required List<List<ElementTerrain>> matriceElementTerrain}) : _matriceElementTerrain = matriceElementTerrain;
    
  void copyMatrice({required List<List<ElementTerrain>> matriceElementTerrain}) {
    for (int y = 0; y < tailleY; y++) {
      for (int x = 0; x < tailleX; x++) {
        _matriceElementTerrain[y][x].copy(matriceElementTerrain[y][x]);
      }
    }
  }

  void copy(Carte carte){
    copyMatrice(matriceElementTerrain: carte._matriceElementTerrain);
  }



  ElementTerrain getElementTerrainFromCoord({required int y, required int x}) {
    if(x >= Carte.tailleX || x < 0 || y >= Carte.tailleY || y < 0){
      return ElementTerrain(nom: "vide" , traversable: false , pathImage: "assets/for_alex/noir.png" , probaPokemon: 0.0);
    }
    return _matriceElementTerrain[y][x];
  }

  @override
  String toString() => 'Carte(_matriceElementTerrain: $_matriceElementTerrain)';

  
}
