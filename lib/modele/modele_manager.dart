import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/io/i_o_listener.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/interaction.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/maitrise/maitrise.dart';
import 'package:pacomon/modele/perso.dart';
import 'package:pacomon/modele/pacomon.dart';

import 'attaque/attaque.dart';
import 'combat/combat.dart';

class ModeleManager implements IOListener{

  static EtatJeu etatJeu = EtatJeuMarche();
  static Interaction interaction = Interaction(phraseAcceuil: "not set" , effet: (){print("interaction not set");});

  static void sendOrderEtatJeu(EnumOrdre ordre){
    etatJeu.whenOrder(ordre);
  }

  static void sendOrderEtatCombat(EnumOrdre ordre){
    combat.etatCombat.whenOrder(ordre);
  }

  static void setAndStartEtatJeu(EtatJeu newEtatJeu){
    etatJeu = newEtatJeu;
    etatJeu.start();
  }

  


  static const double epsilonProbas = 0.000001;




  static Future<void> initialize() async {
    String xlsPath = "assets/for_alex/database_run.xlsx";
    
    
    _carte = await Dao.getCarteFromXlsPath(xlsPath: xlsPath); 
    _listePokemon = await Dao.getListePacomonFromXlsPath(xlsPath: xlsPath);
    hero = Perso(x: await Dao.getXSpawnHero(xlsPath: xlsPath) , y: await Dao.getYSpawnHero(xlsPath: xlsPath),
    
    pv: await Dao.getPvBaseHero(xlsPath: xlsPath), atk: await Dao.getAtkBaseHero(xlsPath: xlsPath) , def: await Dao.getDefBaseHero(xlsPath: xlsPath) , vit: await Dao.getVitBaseHero(xlsPath: xlsPath));
    hero.attaque1 = Attaque(ppMax: await Dao.getPpAttaque1(xlsPath: xlsPath), description: "Inflige votre atk au pacomon adverse", nom: "charge" , hero: ModeleManager.hero, effet: (Perso perso, Pacomon pacomon) { pacomon.recevoirDegatsNet(perso.atk); });
    hero.attaque2 = Attaque(ppMax: await Dao.getPpAttaque2(xlsPath: xlsPath), description: "Vous heal de 50% de vos PV max", nom: "metoibien" , hero: ModeleManager.hero, effet: (Perso perso, Pacomon pacomon) { perso.recevoirSoin(perso.pvMax~/2); });
    hero.attaque3 = Attaque(ppMax: await Dao.getPpAttaque3(xlsPath: xlsPath), description: "Réduit de 100 la défence adverse", nom: "grozieu" , hero: ModeleManager.hero, effet: (Perso perso, Pacomon pacomon) { pacomon.perdreDef(100); });
    hero.attaque4 = Attaque(ppMax: await Dao.getPpAttaque4(xlsPath: xlsPath), description: "Augmente de 100 votre défence ",nom: "gro caillou" , hero: ModeleManager.hero, effet: (Perso perso, Pacomon pacomon) { perso.def += 100; });
    hero.lutte = Attaque(ppMax: 0 , description: "inflige 1 de degat" , nom: "lutte" , hero: ModeleManager.hero, effet: (Perso perso, Pacomon pacomon) { pacomon.recevoirDegatsBrut(1); });

    hero.maitrise = Maitrise(hero: hero, augmentationAtkParPoint: await Dao.getAtkGagneParPointMaitrise(xlsPath: xlsPath), augmentationDefParPoint: await Dao.getDefGagneParPointMaitrise(xlsPath: xlsPath), augmentationPpParPoint: await Dao.getPpGagneParPointMaitrise(xlsPath: xlsPath), augmentationPvParPoint: await Dao.getPvGagneParPointMaitrise(xlsPath: xlsPath), augmentationVitParPoint: await Dao.getVitGagneParPointMaitrise(xlsPath: xlsPath), pointGagneParNiveau: await Dao.getPointMaitriseGagneParNiveau(xlsPath: xlsPath) );

    etatJeu.start();
  }

  

  static late Carte _carte;
  static late Perso hero;
  static late ListePacomon _listePokemon;

  static late Combat combat;

  static Carte get carte => _carte;


  static ListePacomon get listePokemon => _listePokemon;

  @override
  void whenNotify(BoutonsEnum boutonsEnum) {
    switch (boutonsEnum) {
      case BoutonsEnum.HAUT : 
      etatJeu.whenOrder(EnumOrdre.HAUT);
        break;
        case BoutonsEnum.BAS : 
       etatJeu.whenOrder(EnumOrdre.BAS);
        break;
        case BoutonsEnum.GAUCHE : 
        etatJeu.whenOrder(EnumOrdre.GAUCHE);
        break;
        case BoutonsEnum.DROITE : 
        etatJeu.whenOrder(EnumOrdre.DROITE);
        break;
        case BoutonsEnum.A : 
        etatJeu.whenOrder(EnumOrdre.A);
        break;
        case BoutonsEnum.B : 
        etatJeu.whenOrder(EnumOrdre.B);
        break;
        case BoutonsEnum.X : 
        etatJeu.whenOrder(EnumOrdre.X);
        break;
        case BoutonsEnum.Y : 
        etatJeu.whenOrder(EnumOrdre.Y);
        break;
      default:
    }
  }


  


}