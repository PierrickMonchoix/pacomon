import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_action.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_gagne.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_perd.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_va_attaquer.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_va_attaquer.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatAQuiLeTour extends EtatCombat {
  EtatCombatAQuiLeTour({required Combat combat}) : super(combat: combat) ;

  @override
  void whenOrder(EnumOrdre ordre) {}
  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatAQuiLeTour";
  }

  @override
  void start() {
    if (combat.isTourHero()) {
      combat.setAndStartEtatCombat(EtatCombatChoisirAction(combat: combat));
    } else {
      combat.setAndStartEtatCombat(EtatCombatPacomonVaAttaquer(combat: combat));
    }
  }
}
