import 'package:first_flutter_app/modele/carte.dart';

class Perso {
  int _x = Carte.taille ~/ 2;
  int _y = Carte.taille ~/ 2;

  int get x => _x;

  int get y => _y;


  void marcheHaut(){
    _y ++;
  }

  void marcheBas(){
    _y --;
  }

  void marcheGauche(){
    _x --;
  }

  void marcheDroite(){
    _x ++;
  }

  

}