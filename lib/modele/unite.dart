import 'dart:math';

abstract class AUnite{
  int atk;
  int def;
  int pv;
  int pvMax;


  AUnite({required atk , required def , required pv}) : pv = pv , def = def, atk = atk , pvMax = pv;

  void recevoirDegatsNet(int degats){
    double doubleDegatsNet =  degats.toDouble()*pow(0.5, def.toDouble()/100.0);
    int intDegatsNetMayBeZero = doubleDegatsNet.floor();
    int intDegatsNetNotZero = intDegatsNetMayBeZero!=0 ? intDegatsNetMayBeZero : 1;
    pv -= intDegatsNetNotZero;
    if(pv < 0){
      pv = 0;
    }
  }

}