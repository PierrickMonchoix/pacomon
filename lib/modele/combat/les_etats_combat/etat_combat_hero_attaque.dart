import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_a_qui_le_tour.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_check_victoire.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_gagne.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_perd.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatHeroAttaque extends EtatCombat {
  EtatCombatHeroAttaque({required Combat combat}) : super(combat: combat) ;
  @override
  void whenOrder(EnumOrdre ordre) {}
  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatHeroAttaque";
  }

  @override
  void start() {
    combat.heroAttaquePacomon();
    combat.setAndStartEtatCombat(EtatCombatCheckVictoire(combat: combat));
  }
}
