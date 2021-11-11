import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatHeroGagne extends EtatCombat {
  EtatCombatHeroGagne({required Combat combat}) : super(combat : combat) ;

  @override
  void whenOrder(EnumOrdre ordre) {
    combat.finCombat();
  }

  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatHeroGagne";
  }

  @override
  void start() {
    print("### start EtatCombatHeroGagne");
    combat.hero.gagnerExp(combat.pacomon.exp);
    
  }

}
