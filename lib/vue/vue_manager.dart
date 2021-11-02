import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/io/i_o_listener.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/vue/final_views/all_vue.dart';
import 'package:pacomon/vue/carte_vue.dart';
import 'package:pacomon/vue/final_views/carte_et_hero_vue.dart';
import 'package:pacomon/vue/final_views/combat_vue.dart';
import 'package:pacomon/vue/final_views/ecran_vue.dart';
import 'package:pacomon/vue/hero_vue.dart';
import 'package:flutter/cupertino.dart';

class VueManager implements IOListener {

  @override
  void whenNotify(BoutonsEnum boutonsEnum) {
    refresh();
  }

  static AllVue _allVue = AllVue();
  //static EcranVue _ecranVue = EcranVue([];)

  static Future<void> initialize() async{
    CarteVue.taille = await Dao.getTailleCarteVue(xlsPath: "assets/for_alex/database_run.xlsx");
    refresh();
  }



  static void refresh(){

    //on ajoutera les autres vues dessus
    if(ModeleManager.inCombat){
      _allVue.setVueScreenAndRefresh(EcranVue(listWidget: [CombatVue()]));
    }
    else{
      _allVue.setVueScreenAndRefresh(EcranVue(listWidget: [CarteEtHeroVue()]));
    }
    

  }



  static AllVue get allVue => _allVue;

  static CarteVue? _carteVue;

  static CarteVue get carteVue => _carteVue!;





  static double addonX = 0.0;
  static bool sem = true;

  


  static void testChangeXcoordHero(){
    if(sem){
      addonX = 50.0;
    }
    else{
      addonX = - 50.0;
    }
    sem = !sem;

    _allVue.setVueScreenAndRefresh(CarteEtHeroVue());
  }




}
