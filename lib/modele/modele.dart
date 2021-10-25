import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/modele/carte.dart';

class Modele {

  static Carte _carte = Carte.vide();

  static Carte get carte => _carte;

  static Future<void> initialize() async {
    _carte = await Dao.getCarteFromXlsPath(xlsPath: "assets/for_alex/database_run.xlsx"); 
  }

}