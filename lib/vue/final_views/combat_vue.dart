import 'package:pacomon/modele/modele_manager.dart';
import 'package:flutter/material.dart';

class CombatVue extends StatefulWidget {
  CombatVue({Key? key}) : super(key: key);

  @override
  _CarteEtHeroVueState createState() => _CarteEtHeroVueState();
}

class _CarteEtHeroVueState extends State<CombatVue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Image.asset(ModeleManager.combat.pacomon.pathImage),
    );
  }
}
