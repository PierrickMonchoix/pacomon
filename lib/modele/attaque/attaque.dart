import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/perso.dart';

class Attaque {
  String nom;
  Perso perso;
  String description;
  int ppMax;
  int pp;
  bool infinitePp;

  void Function(Perso hero, Pacomon pacomon) effet;

  Attaque(
      {bool infinitePp_ = false,
      required int ppMax,
      required String description,
      required Perso hero,
      required String nom,
      required void Function(Perso perso, Pacomon pacomon) effet})
      : perso = hero,
        nom = nom,
        effet = effet,
        description = description,
        pp = ppMax,
        ppMax = ppMax,
        infinitePp = infinitePp_;

  void executeOn(Pacomon pacomon) {
    effet(perso, pacomon);
    if (!infinitePp) {
      pp--;
    }
  }
}
