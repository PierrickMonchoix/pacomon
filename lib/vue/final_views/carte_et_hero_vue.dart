import 'dart:collection';

import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/global_manager.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/vue/bouton_lettre.dart';
import 'package:pacomon/vue/carte_vue.dart';
import 'package:pacomon/vue/hero_vue.dart';
import 'package:pacomon/vue/vue_manager.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class CarteEtHeroVue extends StatefulWidget {
  
  late CarteVue _carteVue = CarteVue();
  late HeroVue _heroVue = HeroVue();

  CarteEtHeroVue({Key? key}) : super(key: key);

  @override
  _CarteEtHeroVueState createState() => _CarteEtHeroVueState();
}

class _CarteEtHeroVueState extends State<CarteEtHeroVue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: [widget._carteVue, widget._heroVue],
      ),
    );
  }
}
