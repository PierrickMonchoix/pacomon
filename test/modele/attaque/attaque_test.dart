import 'package:flutter_test/flutter_test.dart';
import 'package:pacomon/modele/attaque/attaque.dart';
import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/perso.dart';

void main() {
  testWidgets('attaque', (tester) async {
    Perso perso = Perso(x: 0,y: 0 , atk: 10 ,def: 100, pv: 120);
    
    void Function(Perso perso , Pacomon pacomon) effetAttaque =  (Perso perso , Pacomon pacomon){
      pacomon.recevoirDegatsNet(perso.atk); // 10
    };
    perso.attaque1 = Attaque(nom: "charge" , perso: perso , effet: effetAttaque );
    

    Pacomon pikachu = Pacomon(atk: 12,def: 0, pv: 120, nom: '', pathImage: '', rarete: 0.0);
    perso.attaque1.executeOn(pikachu);
    expect(pikachu.pv, 120 - 10);

    Pacomon raichu = Pacomon(atk: 12,def: 100, pv: 120, nom: '', pathImage: '', rarete: 0.0);
    perso.attaque1.executeOn(raichu);
    expect(raichu.pv, 120 - 10~/2); //une defence de 100 reduit de moitie les degats
    
    Pacomon dracofeu = Pacomon(atk: 12,def: 200, pv: 120, nom: '', pathImage: '', rarete: 0.0);
    perso.attaque1.executeOn(dracofeu);
    expect(dracofeu.pv, 120 - (10~/2)~/2); //une defence de 100 reduit de moitie les degats

  });
}