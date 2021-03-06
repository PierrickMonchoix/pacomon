import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_action.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_a_qui_le_tour.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatPacomonApparait extends EtatCombat {
  EtatCombatPacomonApparait({required Combat combat}) : super(combat : combat) ;

  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        combat.setAndStartEtatCombat( EtatCombatAQuiLeTour(combat : combat) );
        break;
      default:
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatPacomonApparait";
  }

  @override
  void start() {
    // TODO: implement start
  }
}
