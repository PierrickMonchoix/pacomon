import 'package:pacomon/modele/perso.dart';

class Interaction{

  String phraseAcceuil;
  void Function() effet;

  Interaction({required String phraseAcceuil , required void Function() effet}) : phraseAcceuil = phraseAcceuil , effet = effet;

}