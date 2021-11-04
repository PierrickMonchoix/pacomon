import 'dart:math';

abstract class AUnite{
  int _atk;
  int _def;
  int _pv;
  int _pvMax;

  void FOR_TEST_setAtk(int atk){
    _atk = atk;
  }

    void FOR_TEST_setDef(int def){
    _def = def;
  }

    void FOR_TEST_setPv(int pv){
    _pv = pv;
  }

  
  int get pv => this._pv;
  int get atk => this._atk;
  int get def => this._def;
  int get pvMax => this._pvMax;

  AUnite({required atk , required def , required pv}) : _pv = pv , _def = def, _atk = atk , _pvMax = pv;

  void recevoirDegatsNet(int degats){
    double doubleDegatsNet =  degats.toDouble()*pow(0.5, _def.toDouble()/100.0);
    int intDegatsNetMayBeZero = doubleDegatsNet.floor();
    int intDegatsNetNotZero = intDegatsNetMayBeZero!=0 ? intDegatsNetMayBeZero : 1;
    _pv -= intDegatsNetNotZero;
    if(_pv < 0){
      _pv = 0;
    }
  }

}