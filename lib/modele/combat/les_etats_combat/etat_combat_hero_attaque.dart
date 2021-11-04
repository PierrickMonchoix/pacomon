import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_gagne.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_perd.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatHeroAttaque implements EtatCombat {
  EtatCombatHeroAttaque() {
    print("€€€ enter EtatCombatHeroAttaque");
    print("attaque 1 name : " + ModeleManager.perso.attaque1.nom);
    print("pv pcmn: " + ModeleManager.combat.pacomon.pv.toString());
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    if (ModeleManager.perso.pv == 0) {
      ModeleManager.setAndStartEtatCombat(EtatCombatHeroPerd());
    } else if (ModeleManager.combat.pacomon.pv == 0) {
      ModeleManager.setAndStartEtatCombat(EtatCombatHeroGagne());
    } else {
      ModeleManager.setAndStartEtatCombat(EtatCombatPacomonAttaque());
    }
  }
  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatHeroAttaque";
  }

  @override
  void start() {
    ModeleManager.combat.heroAttaquePacomon();
  }
}
