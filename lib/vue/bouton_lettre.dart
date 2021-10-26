import 'package:flutter/material.dart';

class BoutonLettre extends StatelessWidget {

  static const double taille = 40;

  final text;
  final function;

  BoutonLettre({ this.function , this.text });

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap: (){print("bouton press");},
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