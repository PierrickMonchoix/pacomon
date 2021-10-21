import 'package:first_flutter_app/manage_xls_data.dart';
import 'package:first_flutter_app/map_model.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with AfterLayoutMixin<MapView> {
   MapModel mapModel = MapModel(3);

   List<TableRow> listTableRow = [];
  @override
  void afterFirstLayout(BuildContext context) async {
    print("### AFTERFIRSTLAYOUT  _MapViewState ");
    //await setPhoneDatabaseVersion("3");  pour les tests
    MapModel mapModel = await ManageXlsData.getData();


    listTableRow = List.generate(mapModel.size, (i) => TableRow(children:


    List.generate( mapModel.size, (j) => AspectRatio(aspectRatio: 1, child: Image.asset(mapModel.matrice[i][j].pathImg)
    
    ))));


    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    
    return AspectRatio(
      aspectRatio: 1,
      child: Container(color: Colors.grey[800], child: Table(
        children: listTableRow,
      )),
    );
  }
}
