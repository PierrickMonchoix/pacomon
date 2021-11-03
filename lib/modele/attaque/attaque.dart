import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/perso.dart';

class Attaque{

  String nom;
  Perso perso;

  void Function(Perso perso , Pacomon pacomon) effet;

  Attaque({required Perso perso , required String nom , required void Function(Perso perso , Pacomon pacomon) effet}) : perso = perso , nom = nom  , effet = effet;
  
  void executeOn(Pacomon pacomon){
    effet(perso,pacomon);
  }

}