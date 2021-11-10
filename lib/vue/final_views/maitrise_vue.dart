import 'package:pacomon/global_manager.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/maitrise/stat_a_maitriser.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:flutter/material.dart';

class MaitriseVue extends StatefulWidget {
  MaitriseVue({Key? key}) : super(key: key);

  @override
  _MaitriseVueState createState() => _MaitriseVueState();
}

class _MaitriseVueState extends State<MaitriseVue> {
  double coef = GlobalManager.widthScreen;

  Row _row(int stat) {
    return Row(
      children: [
        Container(
          height: 0.07 * coef,
          width: 0.07 * coef,
          child: Center(
              child: Text(
            "+",
            style: TextStyle(
                color: stat == ModeleManager.hero.maitrise.statSelectionee
                    ? Colors.red
                    : Colors.white,
                fontSize: 0.06* coef),
          )),
        ),
        Text(ModeleManager.hero.maitrise.listStats[stat].nom + " : " + ModeleManager.hero.maitrise.listStats[stat].description)
      ],
    );
  }

  List<Row> _listRow() {
    List<Row> listRow = [];
    listRow.add(Row(
      children: [
        Text("      ~ MAITRISE ~ : Points: " +
            ModeleManager.hero.maitrise.pointsAatributer.toString())
      ],
    ));
    listRow.add(Row(children: [SizedBox(height: 0.05 * coef)]));
    for (var i = 0; i < ModeleManager.hero.maitrise.listStats.length; i++) {
      listRow.add(Row(children: [SizedBox(height: 0.02 * coef)]));
      listRow.add(_row(i));
    }
    return listRow;
  }

  @override
  Widget build(BuildContext context) {
    double coef = GlobalManager.widthScreen;
    return Container(
        constraints: BoxConstraints.expand(),
        color: Colors.blueAccent,
        child: Column(
          children: _listRow(),
        ));
  }
}
