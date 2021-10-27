import 'package:first_flutter_app/modele/element_terrain.dart';

class Carte {
  static const int taille = 15;

  List<List<ElementTerrain>> _matriceElementTerrain = List.generate(
      taille, (i) => List.generate(taille, (j) => ElementTerrain.vide()));

  Carte.vide();

  Carte({required List<List<ElementTerrain>> matriceElementTerrain}) : _matriceElementTerrain = matriceElementTerrain;
    
  void copyMatrice({required List<List<ElementTerrain>> matriceElementTerrain}) {
    for (int y = 0; y < taille; y++) {
      for (int x = 0; x < taille; x++) {
        _matriceElementTerrain[y][x].copy(matriceElementTerrain[y][x]);
      }
    }
  }

  void copy(Carte carte){
    copyMatrice(matriceElementTerrain: carte._matriceElementTerrain);
  }



  ElementTerrain getElementTerrainFromCoord({required int y, required int x}) {
    if(x >= Carte.taille || x < 0 || y >= Carte.taille || y < 0){
      return ElementTerrain(nom: "vide" , traversable: false , pathImage: "assets/for_alex/noir.png");
    }
    return _matriceElementTerrain[y][x];
  }

  @override
  String toString() => 'Carte(_matriceElementTerrain: $_matriceElementTerrain)';

  
}
