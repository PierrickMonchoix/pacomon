import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_a_qui_le_tour.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_check_victoire.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_action.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/pacomon.dart';

import 'etat_combat_hero_attaque.dart';
import 'etat_combat_hero_gagne.dart';
import 'etat_combat_hero_perd.dart';

class EtatCombatPacomonAttaque extends EtatCombat {
  EtatCombatPacomonAttaque({required Combat combat}) : super(combat: combat);

  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        combat.pacomon.attaquerPerso(combat.hero);
        combat.setAndStartEtatCombat(EtatCombatCheckVictoire(combat: combat));
         
        break;
      default:
    }
    // TODO: implement whenOrder
  }

  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatPacomonAttaque";
  }

  @override
  void start() {}
}
