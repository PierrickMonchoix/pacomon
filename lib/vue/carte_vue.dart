import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/presentation/carte_pres.dart';
import 'package:flutter/material.dart';

class CarteVue extends StatefulWidget {
  

  List<TableRow> _listTableRow = [];

  CarteVue({Key? key})
      : 
        super(key: key) {
    _listTableRow = List.generate(
        Carte.taille,
        (y) => TableRow(
            children: List.generate(
                Carte.taille,
                (x) => AspectRatio(
                    aspectRatio: 1,
                    child: Container(constraints: BoxConstraints.expand(),  child: Image.asset(ModeleManager.carte.getElementTerrainFromCoord(y: y - (Carte.taille ~/ 2), x: x - (Carte.taille ~/ 2)).pathImage , fit: BoxFit.fill,) )))));
  }

  //ModeleManager.carte.getElementTerrainFromCoord(y: y, x: x).pathImage

/*   String getPathImageFirst() {
    AspectRatio aspectRatio = _listTableRow[0].children![0] as AspectRatio;
    Image image = aspectRatio.child as Image;
    return image.toString();
  } */

  @override
  _CarteVueState createState() => _CarteVueState();
}

class _CarteVueState extends State<CarteVue> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          color: Colors.grey[800],
          child: Table(
            children: widget._listTableRow,
          )),
    );
  }
}

