import 'package:first_flutter_app/personnage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('personnage birthady works', (tester) async {
    // INIT
    Personnage leo = Personnage(10);

    //METHODS
    leo.birthday();

    //TEST
    expect(leo.getAge(), 11);


  });
}