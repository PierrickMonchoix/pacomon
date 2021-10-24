import 'package:first_flutter_app/modele/element_terrain.dart';

class Carte {
  

  static const taille = 3;

  final List<List<ElementTerrain>> _matriceElementTerrain;



  Carte({required List<List<ElementTerrain>> matriceElementTerrain}): _matriceElementTerrain = matriceElementTerrain;

  ElementTerrain getElementTerrainFromCoord({required int y, required  int x}){
    return _matriceElementTerrain[y][x];
  }





  @override
  String toString() => 'Carte(_matriceElementTerrain: $_matriceElementTerrain)';
}
