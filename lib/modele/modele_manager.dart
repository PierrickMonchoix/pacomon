import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/io/i_o_listener.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/liste_pokemon.dart';
import 'package:first_flutter_app/modele/perso.dart';
import 'package:first_flutter_app/modele/pokemon.dart';
import 'package:flutter/cupertino.dart';

class ModeleManager implements IOListener{

  //C'est moche TODO
  static bool inCombat = false; //TODO: faire un pattern etat
  static Pokemon pokemonCombat = Pokemon.vide();

  //fin ce'st moche TODO

  static const double epsilonProbas = 0.000001;




  static Future<void> initialize() async {
    
    
    _carte = await Dao.getCarteFromXlsPath(xlsPath: "assets/for_alex/database_run.xlsx"); 
    _listePokemon = await Dao.getListePokemonFromXlsPath(xlsPath: "assets/for_alex/database_run.xlsx");
    _perso = Perso(x: await Dao.getXSpawnHero(xlsPath: "assets/for_alex/database_run.xlsx") , y: await Dao.getYSpawnHero(xlsPath: "assets/for_alex/database_run.xlsx"));
  }

  static late Carte _carte;
  static late Perso _perso;
  static late ListePokemon _listePokemon;

  static Carte get carte => _carte;

  static Perso get perso => _perso;

  static ListePokemon get listePokemon => _listePokemon;

  @override
  void whenNotify(BoutonsEnum boutonsEnum) {
    switch (boutonsEnum) {
      case BoutonsEnum.HAUT : 
      if(!inCombat){
        _perso.marcheHaut();
      }
        break;
        case BoutonsEnum.BAS : 
        if(!inCombat){
        _perso.marcheBas();
        }
        break;
        case BoutonsEnum.GAUCHE : 
        if(!inCombat){
        _perso.marcheGauche();
        }
        break;
        case BoutonsEnum.DROITE : 
        if(!inCombat){
        _perso.marcheDroite();
        }
        break;
        case BoutonsEnum.B : 
        if(inCombat){
          inCombat = false;
        }
        break;
      default:
    }
  }


  


}