import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_gagne.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_perd.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatHeroAttaque implements EtatCombat {

  EtatCombatHeroAttaque(){
    ModeleManager.combat.heroAttaquePacomon();
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    if (ModeleManager.perso.pv == 0) {
      ModeleManager.combat.etatCombat = EtatCombatHeroPerd();
    } else if (ModeleManager.combat.pacomon.pv == 0) {
      ModeleManager.combat.etatCombat = EtatCombatHeroGagne();
    } else {
      ModeleManager.combat.etatCombat = EtatCombatPacomonAttaque();
    }
  }
}
