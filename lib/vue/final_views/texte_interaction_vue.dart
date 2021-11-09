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


class TexteInteractionVue extends StatefulWidget {
  


  TexteInteractionVue({Key? key}) : super(key: key);

  @override
  _TexteInteractionVueState createState() => _TexteInteractionVueState();
}

class _TexteInteractionVueState extends State<TexteInteractionVue> {
  @override
  Widget build(BuildContext context) {
    double coef = GlobalManager.widthScreen;
    return Positioned(
      child: Container(constraints: BoxConstraints.expand(), decoration:  BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.white,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white), child: Center(child : Text(ModeleManager.interaction.phraseAcceuil))),
      height: 0.2*coef, 
      width: coef,
      bottom: 0.0,
    );
  }

}