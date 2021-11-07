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
            child: Text("          STATS : "),
            top: 0.02 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Niv : " + ModeleManager.perso.niveau.toString()),
            top: 0.1 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("PV : " + ModeleManager.perso.pv.toString() + " / " + ModeleManager.perso.pvMax.toString()),
            top: 0.15 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Atk : " + ModeleManager.perso.atk.toString()),
            top: 0.2 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Def : " + ModeleManager.perso.def.toString()),
            top: 0.25 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Note: Gagner 100 de défence réduit de 50% les dégats reçus" ),
            top: 0.30 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("          ATTAQUES : "),
            top: 0.40 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text(ModeleManager.perso.attaque1.nom + " : " + ModeleManager.perso.attaque1.description ),
            top: 0.50 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text(ModeleManager.perso.attaque2.nom + " : " + ModeleManager.perso.attaque2.description ),
            top: 0.55 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text(ModeleManager.perso.attaque3.nom + " : " + ModeleManager.perso.attaque3.description ),
            top: 0.60 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text(ModeleManager.perso.attaque4.nom + " : " + ModeleManager.perso.attaque4.description ),
            top: 0.65 * coef,
            left: 0.0 * coef,
          ),
        ],
      ),
    );
  }
}
