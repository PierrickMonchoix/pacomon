import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/io/i_o_listener.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/perso.dart';
import 'package:flutter/cupertino.dart';

class ModeleManager implements IOListener{


  static Future<void> initialize() async {
    
    _carte = await Dao.getCarteFromXlsPath(xlsPath: "assets/for_alex/database_run.xlsx"); 
    _perso = Perso();
  }

  static late Carte _carte;
  static late Perso _perso;

  static Carte get carte => _carte;

  static Perso get perso => _perso;

  @override
  void whenNotify(BoutonsEnum boutonsEnum) {
    switch (boutonsEnum) {
      case BoutonsEnum.HAUT : _perso.marcheHaut();
      print("_perso.marcheHaut()");
        break;
        case BoutonsEnum.BAS : _perso.marcheBas();
        print("_perso.marcheBas()");
        break;
        case BoutonsEnum.GAUCHE : _perso.marcheGauche();
        print("_perso.marcheGauche()");
        break;
        case BoutonsEnum.DROITE : _perso.marcheDroite();
        print("_perso.marcheDroite()");
        break;
      default:
    }
  }


  


}