import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_combat.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_stats.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatJeuMarche implements EtatJeu {
  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.HAUT:
        ModeleManager.hero.marcheHaut();
        break;
      case EnumOrdre.BAS:
        ModeleManager.hero.marcheBas();
        break;
      case EnumOrdre.GAUCHE:
        ModeleManager.hero.marcheGauche();
        break;
      case EnumOrdre.DROITE:
        ModeleManager.hero.marcheDroite();
        break;
        case EnumOrdre.Y:
        ModeleManager.etatJeu = EtatJeuStats();
        ModeleManager.etatJeu.start();
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
