import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/io/i_o_listener.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/perso.dart';
import 'package:pacomon/modele/pacomon.dart';

import 'combat/combat.dart';

class ModeleManager implements IOListener{

  static EtatJeu etatJeu = EtatJeuMarche();

  static void sendOrderEtatJeu(EnumOrdre ordre){
    etatJeu.whenOrder(ordre);
  }


  //fin ce'st moche TODO

  static const double epsilonProbas = 0.000001;




  static Future<void> initialize() async {
    
    
    _carte = await Dao.getCarteFromXlsPath(xlsPath: "assets/for_alex/database_run.xlsx"); 
    _listePokemon = await Dao.getListePacomonFromXlsPath(xlsPath: "assets/for_alex/database_run.xlsx");
    _perso = Perso(x: await Dao.getXSpawnHero(xlsPath: "assets/for_alex/database_run.xlsx") , y: await Dao.getYSpawnHero(xlsPath: "assets/for_alex/database_run.xlsx"),
    pv: 100, atk: 10 , def: 10);
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