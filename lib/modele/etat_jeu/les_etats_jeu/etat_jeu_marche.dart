import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_combat.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatJeuMarche implements EtatJeu {
  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.HAUT:
        ModeleManager.perso.marcheHaut();
        break;
      case EnumOrdre.BAS:
        ModeleManager.perso.marcheBas();
        break;
      case EnumOrdre.GAUCHE:
        ModeleManager.perso.marcheGauche();
        break;
      case EnumOrdre.DROITE:
        ModeleManager.perso.marcheDroite();
        break;
      case EnumOrdre.DEMARRER_COMBAT:
        ModeleManager.etatJeu = EtatJeuCombat();  
        ModeleManager.etatJeu.start();   //TODO en 1 seul f() et rendre private
        break;
      default:
    }
  }

  @override
  void start() {
    // TODO: implement start
  }
}
