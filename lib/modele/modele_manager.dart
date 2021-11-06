import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/io/i_o_listener.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/perso.dart';
import 'package:pacomon/modele/pacomon.dart';

import 'attaque/attaque.dart';
import 'combat/combat.dart';

class ModeleManager implements IOListener{


  static void setAndStartEtatCombat(EtatCombat etatCombat){
    combat.etatCombat = etatCombat;
    combat.etatCombat.start();
  }

  static EtatJeu etatJeu = EtatJeuMarche();

  static void sendOrderEtatJeu(EnumOrdre ordre){
    etatJeu.whenOrder(ordre);
  }

  static void sendOrderEtatCombat(EnumOrdre ordre){
    combat.etatCombat.whenOrder(ordre);
  }


  //fin ce'st moche TODO

  static const double epsilonProbas = 0.000001;




  static Future<void> initialize() async {
    String xlsPath = "assets/for_alex/database_run.xlsx";
    
    
    _carte = await Dao.getCarteFromXlsPath(xlsPath: xlsPath); 
    _listePokemon = await Dao.getListePacomonFromXlsPath(xlsPath: xlsPath);
    _perso = Perso(x: await Dao.getXSpawnHero(xlsPath: xlsPath) , y: await Dao.getYSpawnHero(xlsPath: xlsPath),
    augmentationStatParNiveau: await Dao.getAugmentationStatsParLevelHero(xlsPath: xlsPath),
    pv: await Dao.getPvBaseHero(xlsPath: xlsPath), atk: await Dao.getAtkBaseHero(xlsPath: xlsPath) , def: await Dao.getDefBaseHero(xlsPath: xlsPath));
    _perso.attaque1 = Attaque(nom: "charge" , perso: ModeleManager.perso, effet: (Perso perso, Pacomon pacomon) { pacomon.recevoirDegatsNet(perso.atk); });
    _perso.attaque2 = Attaque(nom: "metoibien" , perso: ModeleManager.perso, effet: (Perso perso, Pacomon pacomon) { perso.recevoirSoin(perso.pvMax~/2); });
    _perso.attaque3 = Attaque(nom: "grozieu" , perso: ModeleManager.perso, effet: (Perso perso, Pacomon pacomon) { pacomon.perdreDef(100); });
    _perso.attaque4 = Attaque(nom: "gro caillou" , perso: ModeleManager.perso, effet: (Perso perso, Pacomon pacomon) { perso.def += 100; });

    etatJeu.start();
  }

  static late Carte _carte;
  static late Perso _perso;
  static late ListePacomon _listePokemon;

  static late Combat combat;

  static Carte get carte => _carte;

  static Perso get perso => _perso;

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