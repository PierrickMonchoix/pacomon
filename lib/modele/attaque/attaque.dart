import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/perso.dart';

class Attaque{

  String nom;
  Perso perso;
  String description;
  int PpMAx;
  int pp;

  void Function(Perso hero , Pacomon pacomon) effet;

  Attaque({ required int ppMax , required String description , required Perso hero , required String nom , required void Function(Perso perso , Pacomon pacomon) effet}) : perso = hero , nom = nom  , effet = effet , description = description , pp = ppMax , PpMAx = ppMax;
  

  void executeOn(Pacomon pacomon){
    effet(perso,pacomon);
    pp --;
  }

}