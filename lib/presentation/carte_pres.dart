import 'package:first_flutter_app/modele/carte.dart';

class CartePres {

  Carte _carteModele;

  CartePres({required Carte carteModele}) : _carteModele = carteModele;

  String getPathElementTerrainFromCoord({required int y, required  int x}){
    return _carteModele.getElementTerrainFromCoord(y: y, x: x).pathImage;
  }

}
