import 'package:first_flutter_app/modele/element_terrain.dart';

class Carte {

  static const taille = 3;

  final List<List<ElementTerrain>> _listElementTerrain;

  Carte({required List<List<ElementTerrain>> listElementTerrain}): _listElementTerrain = listElementTerrain;

  ElementTerrain getElementTerrainCoord(int y, int x){
    return _listElementTerrain[y][x];
  }

}