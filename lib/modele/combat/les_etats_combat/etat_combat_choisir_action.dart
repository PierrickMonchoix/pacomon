import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

import '../combat.dart';

class EtatCombatChoisirAction extends EtatCombat {
  EtatCombatChoisirAction({required Combat combat}) : super(combat : combat) ;

  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        combat.setAndStartEtatCombat(EtatCombatChoisirAttaque(combat: combat));
        break;

      default:
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatChoisirAttaque";
  }

  @override
  void start() {
    // TODO: implement start
  }
}
