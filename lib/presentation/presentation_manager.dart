import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/presentation/carte_pres.dart';
import 'package:first_flutter_app/vue/carte_vue.dart';

class PresentationManager {



  static void initialize() {
    _cartePres = CartePres(carteModele: ModeleManager.carte);
  }  

  static CartePres? _cartePres;

  static CartePres get cartePres => _cartePres!;


}