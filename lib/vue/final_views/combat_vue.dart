import 'package:pacomon/global_manager.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:flutter/material.dart';

class CombatVue extends StatefulWidget {
  CombatVue({Key? key}) : super(key: key);

  @override
  _CarteEtHeroVueState createState() => _CarteEtHeroVueState();
}

class _CarteEtHeroVueState extends State<CombatVue> {
  @override
  Widget build(BuildContext context) {
    double coef = GlobalManager.widthScreen;
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.blueGrey,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(ModeleManager.combat.pacomon.pathImage),
            height: 0.4 * coef,
            width: 0.4 * coef,
            top: 0.0 * coef,
            right: 0.0 * coef,
          ),
          Positioned(
            child: Image.asset("assets/for_alex/hero.png"),
            height: 0.4 * coef,
            width: 0.4 * coef,
            bottom: 0.3 * coef,
            left: 0.0 * coef,
          ),
          Positioned(
            child: LinearProgressIndicator(
                value: ModeleManager.combat.pacomon.pv /
                    ModeleManager.combat.pacomon.pvMax,
                backgroundColor: Colors.black,
                color: Colors.green),
            height: 0.07 * coef,
            width: 0.45 * coef,
            left: 0.1 * coef,
            top: 0.05 * coef,
          ),
          Positioned(
            child: LinearProgressIndicator(
                value: ModeleManager.perso.pv /
                    ModeleManager.perso.pvMax,
                backgroundColor: Colors.black,
                color: Colors.green),
            height: 0.07 * coef,
            width: 0.45 * coef,
            right: 0.15 * coef,
            top: 0.5 * coef,
          ),
          Positioned(
            child: LinearProgressIndicator(
                value: ModeleManager.perso.exp /
                    ModeleManager.perso.expNecessaire(),
                backgroundColor: Colors.grey[700],
                color: Colors.blue),
            height: 0.02 * coef,
            width: 0.45 * coef,
            right: 0.15 * coef,
            top: (0.5+0.07) * coef,
          ),
          Positioned(
            child: Text( "PV : "+ ModeleManager.perso.pv.toString() + " / " + ModeleManager.perso.pvMax.toString() , style: TextStyle(fontSize: 0.035 * coef),),
            height: 0.07 * coef,
            width: 0.45 * coef,
            right: 0.15 * coef,
            top: 0.6 * coef,
          ),
          Positioned(
            child: Text("Niv. : "+ ModeleManager.perso.niveau.toString()  , style: TextStyle(fontSize: 0.035 * coef),),
            height: 0.07 * coef,
            width: 0.45 * coef,
            right: 0.15 * coef,
            top: 0.65* coef,
          ),
          !(ModeleManager.combat.etatCombat is EtatCombatChoisirAttaque) ? Container(): Positioned(
            child: Container(
                constraints: BoxConstraints.expand(),
                child: Center(child: Text(ModeleManager.perso.attaque1.nom)),
                decoration:  BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: ModeleManager.combat.attaqueSelected == 1 ? Colors.red : Colors.white,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white) ),
            height: 0.12 * coef,
            width: 0.35 * coef,
            bottom: 0.15*coef,
            left: 0.0,
          ),
          !(ModeleManager.combat.etatCombat is EtatCombatChoisirAttaque) ? Container():  Positioned(
            child: Container(
                constraints: BoxConstraints.expand(),
                child: Center(child: Text(ModeleManager.perso.attaque2.nom)),
                decoration:  BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: ModeleManager.combat.attaqueSelected == 2 ? Colors.red : Colors.white,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white) ),
            height: 0.12 * coef,
            width: 0.35 * coef,
            bottom: 0.15*coef,
            left: 0.4*coef,
          ),
          !(ModeleManager.combat.etatCombat is EtatCombatChoisirAttaque) ? Container(): Positioned(
            child: Container(
                constraints: BoxConstraints.expand(),
                child: Center(child: Text(ModeleManager.perso.attaque3.nom)),
                decoration:  BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: ModeleManager.combat.attaqueSelected == 3 ? Colors.red : Colors.white,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white) ),
            height: 0.12 * coef,
            width: 0.35 * coef,
            bottom: 0.0*coef,
            left: 0.0,
          ),
          !(ModeleManager.combat.etatCombat is EtatCombatChoisirAttaque) ? Container(): Positioned(
            child: Container(
                constraints: BoxConstraints.expand(),
                child: Center(child: Text(ModeleManager.perso.attaque4.nom)),
                decoration:  BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color:  ModeleManager.combat.attaqueSelected == 4 ? Colors.red : Colors.white,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white)),
            height: 0.12 * coef,
            width: 0.35 * coef,
            bottom: 0.0*coef,
            left: 0.4*coef,
          ),
          
        ],
      ),
    );
  }
}
