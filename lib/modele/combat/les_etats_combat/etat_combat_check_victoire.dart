import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_a_qui_le_tour.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_action.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_gagne.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_perd.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_va_attaquer.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_va_attaquer.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatCheckVictoire extends EtatCombat {
  EtatCombatCheckVictoire({required Combat combat}) : super(combat: combat);

  @override
  void whenOrder(EnumOrdre ordre) {}
  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatCheckVictoire";
  }

  @override
  void start() {
    print("###### check victoire");
    if (combat.hero.pv == 0) {
      
      combat.setAndStartEtatCombat(EtatCombatHeroPerd(combat: combat));
    } else if (combat.pacomon.pv == 0) {
      print("###### check victoire : hero gagne");
      combat.setAndStartEtatCombat(EtatCombatHeroGagne(combat: combat));
    } else {
      combat.setAndStartEtatCombat(EtatCombatAQuiLeTour(combat: combat));
    }
  }
}
