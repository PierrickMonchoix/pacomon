import 'dart:collection';

import 'package:pacomon/global_manager.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/vue/vue_manager.dart';
import 'package:flutter/material.dart';

import 'carte_vue.dart';

class HeroVue extends StatefulWidget {

  double _tailleCase = GlobalManager.widthScreen/(CarteVue.taille.toDouble());

  late Widget _widget;

  HeroVue({Key? key}) : super(key: key){
 

    _widget = Positioned(
      left: (CarteVue.taille/2).floor()*_tailleCase,
      top: ( -0.5 + (CarteVue.taille/2).floor() )*_tailleCase,
      child: Container(
        width: 1.0*_tailleCase ,
        height: 1.5*_tailleCase,
        child: Image.asset("assets/for_alex/hero.png")));
  }


  @override
  _HeroVueState createState() => _HeroVueState();
}

class _HeroVueState extends State<HeroVue> {
  @override
  Widget build(BuildContext context) {
    print("build HeroVue");
    return widget._widget;
  }
}
