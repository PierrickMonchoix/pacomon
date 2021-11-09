import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_combat.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_stats.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatJeuIntercation implements EtatJeu {
  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        ModeleManager.interaction.effet();
        ModeleManager.setAndStartEtatJeu(EtatJeuMarche());
        break;
      case EnumOrdre.B:
        ModeleManager.interaction.effet();
        ModeleManager.setAndStartEtatJeu(EtatJeuMarche());
        break;
      default:
    }
  }

  @override
  void start() {}
}
