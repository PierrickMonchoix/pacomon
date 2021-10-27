import 'dart:collection';

import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/global_manager.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/presentation/carte_pres.dart';
import 'package:first_flutter_app/presentation/presentation_manager.dart';
import 'package:first_flutter_app/vue/bouton_lettre.dart';
import 'package:first_flutter_app/vue/carte_vue.dart';
import 'package:first_flutter_app/vue/hero_vue.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';
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
