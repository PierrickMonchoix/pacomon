import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:pacomon/modele/pacomon.dart';
main(){

  testWidgets('test truc', (tester)async  {
    Pacomon salameche = Pacomon(atk: 0, categorie: '', def: 0, nom: 'salameche', pathImage: '', pv: 0, rarete: 0);
    Pacomon pikachu = Pacomon(atk: 1, categorie: '', def: 0, nom: 'pikachu', pathImage: '', pv: 0, rarete: 0);

    List<Pacomon> listbase = [salameche , pikachu];
    print (listbase);

    List<Pacomon> listpika = listbase.where((pacomon) => pacomon.atk == 1).toList();
    print ("\n\n");
    print (listpika);   
  }, tags: "t");


  
}