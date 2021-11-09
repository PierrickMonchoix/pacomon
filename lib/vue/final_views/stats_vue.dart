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
            child: Text("Niv : " + ModeleManager.hero.niveau.toString()),
            top: 0.1 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("PV : " + ModeleManager.hero.pv.toString() + " / " + ModeleManager.hero.pvMax.toString()),
            top: 0.15 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Atk : " + ModeleManager.hero.atk.toString()),
            top: 0.2 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text("Def : " + ModeleManager.hero.def.toString()),
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
            child: Text(ModeleManager.hero.attaque1.nom + " ( " + ModeleManager.hero.attaque1.pp.toString() + "/" + ModeleManager.hero.attaque1.ppMax.toString() + " ) " + " : " + ModeleManager.hero.attaque1.description ),
            top: 0.50 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text(ModeleManager.hero.attaque2.nom + " ( " + ModeleManager.hero.attaque2.pp.toString() + "/" + ModeleManager.hero.attaque2.ppMax.toString() + " ) " + " : " + ModeleManager.hero.attaque2.description ),
            top: 0.55 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text(ModeleManager.hero.attaque3.nom + " ( " + ModeleManager.hero.attaque3.pp.toString() + "/" + ModeleManager.hero.attaque3.ppMax.toString() + " ) " + " : " + ModeleManager.hero.attaque3.description ),
            top: 0.60 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: Text(ModeleManager.hero.attaque4.nom + " ( " + ModeleManager.hero.attaque4.pp.toString() + "/" + ModeleManager.hero.attaque4.ppMax.toString() + " ) " + " : " + ModeleManager.hero.attaque4.description ),
            top: 0.65 * coef,
            left: 0.0 * coef,
          ),
        ],
      ),
    );
  }
}
