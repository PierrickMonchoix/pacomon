import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';

class Perso {
  int _x = Carte.taille ~/ 2;
  int _y = Carte.taille ~/ 2;

  int get x => _x;

  int get y => _y;

  void marcheHaut() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y - 1, x: _x);
    if (nextBloc.traversable) {
      _y--;
    }
    print("x perso: $_x    y perso: $_y");
  }

  void marcheBas() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y + 1, x: _x);
    if (nextBloc.traversable) {
      _y++;
    }
    print("x perso: $_x    y perso: $_y");
  }

  void marcheGauche() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x - 1);
    if (nextBloc.traversable) {
      _x--;
    }
    print("x perso: $_x    y perso: $_y");
  }

  void marcheDroite() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x + 1);
    if (nextBloc.traversable) {
      _x++;
    }
    print("x perso: $_x    y perso: $_y");
  }
}
