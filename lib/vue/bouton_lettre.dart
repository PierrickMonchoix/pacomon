import 'package:first_flutter_app/io/i_o_listener.dart';
import 'package:first_flutter_app/io/i_o_manager.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';
import 'package:flutter/material.dart';

class BoutonLettre extends StatelessWidget {

  static const double taille = 40;

  String text;
  BoutonsEnum typeBouton;

  BoutonLettre({ required this.typeBouton ,  required this.text });

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap: (){IOManager.whenButtonPressed(typeBouton);},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.white
              )
            ),/* 
            height: BoutonLettre.taille, 
            width: BoutonLettre.taille,  */
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white , fontSize: 20),
              )
            ),
            ),
        )
     
    );
  }
}