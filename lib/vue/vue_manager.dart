
import 'package:first_flutter_app/presentation/presentation_manager.dart';
import 'package:first_flutter_app/vue/all_vue.dart';
import 'package:first_flutter_app/vue/carte_vue.dart';
import 'package:flutter/cupertino.dart';

class VueManager {


  static void initialize() {
    _carteVue = CarteVue(cartePres: PresentationManager.cartePres );
    
    _allVue.setVueScreenAndRefresh(_carteVue!);
  }  

  static AllVue _allVue = AllVue();

  static AllVue get allVue => _allVue;

  static CarteVue? _carteVue;

  static CarteVue get carteVue => _carteVue!;


}