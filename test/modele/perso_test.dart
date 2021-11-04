import 'package:flutter_test/flutter_test.dart';
import 'package:pacomon/modele/perso.dart';

void main() {
  testWidgets('perso gain exp 1', (tester) async {
    Perso perso = Perso(atk: 10, def: 100, pv: 120, x: 0, y: 0);
    perso.gagnerExp(12);
    expect(perso.exp, 2);
    expect(perso.niveau, 2);
    expect(perso.atk, 11);
    expect(perso.def, 100);
    expect(perso.pvMax, 132);

  } );


    testWidgets('perso gain exp 2', (tester) async {
    Perso perso = Perso(atk: 10, def: 100, pv: 120, x: 0, y: 0);
    perso.gagnerExp(52);
    expect(perso.exp, 2);
    expect(perso.niveau, 3);
    expect(perso.atk, 12);
    expect(perso.def, 100);
    expect(perso.pvMax, 145);

  } );
}