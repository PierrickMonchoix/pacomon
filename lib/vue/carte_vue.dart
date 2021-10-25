import 'package:first_flutter_app/manage_xls_data.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/presentation/carte_pres.dart';
import 'package:flutter/material.dart';

class CarteVue extends StatefulWidget {
  CartePres _cartePres;

  List<TableRow> _listTableRow = [];

  CarteVue({Key? key, required CartePres cartePres})
      : _cartePres = cartePres,
        super(key: key) {
    _listTableRow = List.generate(
        Carte.taille,
        (y) => TableRow(
            children: List.generate(
                Carte.taille,
                (x) => AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(_cartePres
                        .getPathElementTerrainFromCoord(y: y, x: x))))));
  }

  String getPathImageFirst() {
    AspectRatio aspectRatio = _listTableRow[0].children![0] as AspectRatio;
    Image image = aspectRatio.child as Image;
    return image.toString();
  }

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
