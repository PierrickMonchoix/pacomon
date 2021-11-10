import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_combat.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_stats.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatJeuMaitrise implements EtatJeu {
  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        ModeleManager.hero.maitrise.ameliorerStatWithPoint();
        break;
      case EnumOrdre.B:
        ModeleManager.etatJeu = EtatJeuMarche();  
        ModeleManager.etatJeu.start(); 
        break;
        case EnumOrdre.Y:
        ModeleManager.setAndStartEtatJeu(EtatJeuStats());
        break;
        case EnumOrdre.BAS:
        ModeleManager.hero.maitrise.goNextStat();
        break;
        case EnumOrdre.HAUT:
        ModeleManager.hero.maitrise.goPreviousStat();
        break;
      default:
    }
  }

  @override
  void start() {
    // TODO: implement start
  }
}
