import 'package:pacomon/modele/maitrise/stat_a_maitriser.dart';
import 'package:pacomon/modele/perso.dart';

class Maitrise {

  int pointGagneParNiveau;

  Perso hero;
  int pointsAatributer = 0;
  int statSelectionee = 0;

  int augmentationAtkParPoint;
  int augmentationDefParPoint;
  int augmentationVitParPoint;
  int augmentationPvParPoint;
  int augmentationPpParPoint;

  List<StatAmaitriser> listStats = [];

  void ameliorerStatWithPoint() {
    if (pointsAatributer > 0) {
      listStats[statSelectionee].effetParPoint();
      pointsAatributer --;
    }
  }

  void goNextStat() {
    print("###  etat " + statSelectionee.toString());
    if (statSelectionee <= listStats.length - 2) {
      statSelectionee++;
    } else {
      statSelectionee = 0;
    }
  }

  void goPreviousStat() {
    if (statSelectionee > 0) {
      statSelectionee--;
    } else {
      statSelectionee = listStats.length - 1;
    }
  }

  Maitrise({required int pointGagneParNiveau , required Perso hero , required int augmentationAtkParPoint , required int augmentationDefParPoint , required int augmentationVitParPoint ,  required int augmentationPvParPoint , required int augmentationPpParPoint }) :
   hero = hero,
   augmentationAtkParPoint = augmentationAtkParPoint,
   augmentationDefParPoint = augmentationDefParPoint,
   augmentationVitParPoint = augmentationVitParPoint,
   augmentationPpParPoint = augmentationPpParPoint,
   augmentationPvParPoint = augmentationPvParPoint,
   pointGagneParNiveau = pointGagneParNiveau
    {
    listStats.add(StatAmaitriser(
        nom: "atk",
        description: "Augmente l'atk de " + augmentationAtkParPoint.toString(),
        effetParPoint: () {
          hero.baseAtk += augmentationAtkParPoint;
          hero.resetStats();
        }));

    listStats.add(StatAmaitriser(
        nom: "def",
        description: "Augmente la def de " + augmentationDefParPoint.toString(),
        effetParPoint: () {
          hero.baseDef += augmentationDefParPoint;
          hero.resetStats();
        }));

    listStats.add(StatAmaitriser(
        nom: "vit",
        description: "Augmente la vitesse de " + augmentationVitParPoint.toString(),
        effetParPoint: () {
          hero.baseVit += augmentationVitParPoint;
          hero.resetStats();
        }));

    listStats.add(StatAmaitriser(
        nom: "pvMax",
        description: "Augmente les pvMax de " + augmentationPvParPoint.toString(),
        effetParPoint: () {
          hero.basePvMax += augmentationPvParPoint;
          hero.resetStats();
        }));

    listStats.add(StatAmaitriser(
        nom: "ppMax 1",
        description: "augmente les ppMax de < " + hero.attaque1.nom + " > de " + augmentationPpParPoint.toString(),
        effetParPoint: () {
          hero.attaque1.ppMax += augmentationPpParPoint;
          hero.attaque1.pp += augmentationPpParPoint;
          hero.resetStats();
        }));

    listStats.add(StatAmaitriser(
        nom: "ppMax 2",
        description: "augmente les ppMax de < " + hero.attaque2.nom + " > de " + augmentationPpParPoint.toString(),
        effetParPoint: () {
          hero.attaque2.ppMax += augmentationPpParPoint;
          hero.attaque2.pp += augmentationPpParPoint;
          hero.resetStats();
        }));

    listStats.add(StatAmaitriser(
        nom: "ppMax 3",
        description: "augmente les ppMax de < " + hero.attaque3.nom + " > de " + augmentationPpParPoint.toString(),
        effetParPoint: () {
          hero.attaque3.ppMax += augmentationPpParPoint;
          hero.attaque3.pp += augmentationPpParPoint;
          hero.resetStats();
        }));

    listStats.add(StatAmaitriser(
        nom: "ppMax 4",
        description: "augmente les ppMax de < " + hero.attaque4.nom + " > de " + augmentationPpParPoint.toString(),
        effetParPoint: () {
          hero.attaque4.ppMax += augmentationPpParPoint;
          hero.attaque4.pp += augmentationPpParPoint;
          hero.resetStats();
        }));
  }
}
