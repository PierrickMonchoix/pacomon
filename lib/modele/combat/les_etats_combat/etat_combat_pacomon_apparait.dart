import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatPacomonApparait implements EtatCombat {

  @override
  void whenOrder(EnumOrdre ordre) {
    ModeleManager.combat.etatCombat = EtatCombatChoisirAttaque();
  }

}