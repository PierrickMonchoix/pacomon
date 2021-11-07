import 'package:pacomon/global_manager.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:flutter/material.dart';

class StatsVue extends StatefulWidget {
  StatsVue({Key? key}) : super(key: key);

  @override
  _StatsVueState createState() => _StatsVueState();
}

class _StatsVueState extends State<StatsVue> {
  @override
  Widget build(BuildContext context) {
    double coef = GlobalManager.widthScreen;
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.blueAccent,
      child: Stack(
        children: [
          Positioned(
            child: Text("PV : " + ModeleManager.perso.pv.toString()),
            top: 0.1 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("PV Max: " + ModeleManager.perso.pvMax.toString()),
            top: 0.2 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Atk : " + ModeleManager.perso.atk.toString()),
            top: 0.3 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Def : " + ModeleManager.perso.def.toString()),
            top: 0.4 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Niv : " + ModeleManager.perso.niveau.toString()),
            top: 0.6 * coef,
            left: 0.0 * coef,
          ),
        ],
      ),
    );
  }
}
