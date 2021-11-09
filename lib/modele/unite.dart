import 'dart:math';

abstract class AUnite{
  int atk;
  int def;
  int pv;
  int pvMax;
  int vit;


  AUnite({required vit , required atk , required def , required pv}) : pv = pv , def = def, atk = atk , pvMax = pv , vit = vit{
    if(vit == 0){
      throw Exception("Vitesse égale à zero interdit");
    }
  }

  void recevoirDegatsNet(int degats){
    double doubleDegatsNet =  degats.toDouble()*pow(0.5, def.toDouble()/100.0);
    int intDegatsNetMayBeZero = doubleDegatsNet.floor();
    int intDegatsNetNotZero = intDegatsNetMayBeZero!=0 ? intDegatsNetMayBeZero : 1;
    pv -= intDegatsNetNotZero;
    if(pv < 0){
      pv = 0;
    }
  }

  void recevoirSoin(int soin){
    pv += soin;
    if(pv>pvMax){
      pv = pvMax;
    }
  }

  void perdreDef(int malus){
    def -= malus;
    if(def < 0){
      def = 0;
    }
  }

}