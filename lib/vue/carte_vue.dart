import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:flutter/material.dart';

class CarteVue extends StatefulWidget {


  static late int taille;
  

  List<TableRow> _listTableRow = [];

  CarteVue({Key? key})
      : 
        super(key: key) {
    _listTableRow = List.generate(
        taille,
        (y) => TableRow(
            children: List.generate(
                taille,
                (x) => AspectRatio(
                    aspectRatio: 1,
                    child: Container(constraints: BoxConstraints.expand(),  child: Image.asset(ModeleManager.carte.getElementTerrainFromCoord(y: y - (taille ~/ 2) + ModeleManager.hero.y, x: x - (taille ~/ 2) + ModeleManager.hero.x).pathImage , fit: BoxFit.fill,) )))));
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

